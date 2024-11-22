CREATE TABLE IF NOT EXISTS `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
);


CREATE TABLE  IF NOT EXISTS `roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
)

CREATE TABLE IF NOT EXISTS `user_roles` (
  `user_id` int unsigned NOT NULL,
  `role_id` int unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_role_id_foreign` (`role_id`),
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
)

DELIMITER $$

CREATE FUNCTION `get_user_info`(user_id INT) RETURNS JSON
DETERMINISTIC
BEGIN
    DECLARE user_info JSON;
    SELECT JSON_OBJECT(
        'id', u.id,
        'username', u.username,
        'role', r.name
    ) INTO user_info
    FROM users u
    JOIN user_roles ur ON u.id = ur.user_id
    JOIN roles r ON ur.role_id = r.id
    WHERE u.id = user_id;

    RETURN user_info;
END$$

DELIMITER ;

-- function get menus
DELIMITER $$
CREATE FUNCTION `get_menus`() RETURNS JSON
DETERMINISTIC
BEGIN
    DECLARE menus JSON;
    SELECT JSON_ARRAYAGG(
        JSON_OBJECT(
            'id', m.id,
            'p_id', m.p_id,
            'name', m.name,
            'url', m.url,
            'icon', m.icon
        )
    ) INTO menus
    FROM menus m
    WHERE m.active = 1;

    RETURN menus;
END$$

DELIMITER ;

-- get menu tree
DELIMITER $$
CREATE FUNCTION `get_menu_tree`() RETURNS JSON
DETERMINISTIC
BEGIN 
    DECLARE menu_tree JSON;
    SELECT JSON_ARRAYAGG(
        JSON_OBJECT(
            'id', m.id,
            'p_id', m.p_id,
            'name', m.name,
            'url', m.url,
            'icon', m.icon,
            'children', (
              SELECT JSON_ARRAYAGG(
                JSON_OBJECT(
                    'id', m1.id,
                    'p_id', m1.p_id,
                    'name', m1.name,
                    'url', m1.url,
                    'icon', m1.icon
                )
              )
              FROM menus m1
              WHERE m1.p_id = m.id AND m1.active = 1
            ) 
        )
    ) INTO menu_tree
    FROM menus m
    WHERE m.p_id is null AND m.active = 1;

    RETURN menu_tree;
END$$
DELIMITER ;




CREATE TABLE IF NOT EXISTS `menus` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `p_id` int unsigned DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `active` tinyint(1) DEFAULT 1,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `menus_p_id_foreign` FOREIGN KEY (`p_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
)
CREATE TABLE IF NOT EXISTS `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) CREATE TABLE IF NOT EXISTS `user_roles` (
  `user_id` int unsigned NOT NULL,
  `role_id` int unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`, `role_id`),
  KEY `user_roles_role_id_foreign` (`role_id`),
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) DELIMITER $ $ CREATE FUNCTION `get_user_info`(user_id INT) RETURNS JSON DETERMINISTIC BEGIN DECLARE user_info JSON;

SELECT
  JSON_OBJECT(
    'id',
    u.id,
    'username',
    u.username,
    'role',
    r.name
  ) INTO user_info
FROM
  users u
  JOIN user_roles ur ON u.id = ur.user_id
  JOIN roles r ON ur.role_id = r.id
WHERE
  u.id = user_id;

RETURN user_info;

END $ $ DELIMITER;

-- function get menus
DELIMITER $ $ CREATE FUNCTION `get_menus`() RETURNS JSON DETERMINISTIC BEGIN DECLARE menus JSON;

SELECT
  JSON_ARRAYAGG(
    JSON_OBJECT(
      'id',
      m.id,
      'p_id',
      m.p_id,
      'name',
      m.name,
      'url',
      m.url,
      'icon',
      m.icon
    )
  ) INTO menus
FROM
  menus m
WHERE
  m.active = 1;

RETURN menus;

END $ $ DELIMITER;

-- get menu tree
DELIMITER $ $ CREATE FUNCTION `get_menu_tree`() RETURNS JSON DETERMINISTIC BEGIN DECLARE menu_tree JSON;

SELECT
  JSON_ARRAYAGG(
    JSON_OBJECT(
      'id',
      m.id,
      'p_id',
      m.p_id,
      'name',
      m.name,
      'url',
      m.url,
      'icon',
      m.icon,
      'children',
      (
        SELECT
          JSON_ARRAYAGG(
            JSON_OBJECT(
              'id',
              m1.id,
              'p_id',
              m1.p_id,
              'name',
              m1.name,
              'url',
              m1.url,
              'icon',
              m1.icon
            )
          )
        FROM
          menus m1
        WHERE
          m1.p_id = m.id
          AND m1.active = 1
      )
    )
  ) INTO menu_tree
FROM
  menus m
WHERE
  m.p_id is null
  AND m.active = 1;

RETURN menu_tree;

END $ $ DELIMITER;

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
) DROP IF EXISTS TABLE `units`;

CREATE TABLE IF NOT EXISTS `units` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL UNIQUE,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) DELIMITER $ $ CREATE FUNCTION `get_units`() RETURNS JSON DETERMINISTIC BEGIN DECLARE units JSON;

SELECT
  JSON_ARRAYAGG(
    JSON_OBJECT(
      'id',
      u.id,
      'name',
      u.name
    )
  ) INTO units
FROM
  units u;

RETURN units;

END $ $ DELIMITER;

DELIMITER $ $ CREATE PROCEDURE `add_unit`(unit_name VARCHAR(255)) RETURNS INT DETERMINISTIC BEGIN
INSERT INTO
  units(name, created_at, updated_at)
VALUES
(unit_name, NOW(), NOW());

RETURN 1;

END $ $ DELIMITER;

DROP TABLE IF EXISTS `companies`;

CREATE TABLE `companies` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) DROP TABLE IF EXISTS `distributors`;

CREATE TABLE `distributors` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) DROP TABLE IF EXISTS `types`;

CREATE TABLE `types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `level` int unsigned NOT NULL,
  `p_id` int unsigned DEFAULT NULL,
  `icon` varchar(255) DEFAULT 'mdi:pill',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) CONSTRAINT `types_p_id_foreign` FOREIGN KEY (`p_id`) REFERENCES `types` (`id`) ON DELETE CASCADE
) DROP TABLE IF EXISTS `logging_types`;

CREATE TABLE `logging_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) DROP TABLE IF EXISTS `system_logs`;

CREATE TABLE `system_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `logging_type_id` int unsigned NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `system_logs_logging_type_id_foreign` FOREIGN KEY (`logging_type_id`) REFERENCES `logging_types` (`id`) ON DELETE CASCADE,
  CONSTRAINT `system_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `images` text DEFAULT NULL,
  `description_image` text DEFAULT NULL,
  `company_id` int unsigned,
  `distributor_id` int unsigned NOT NULL,
  `type_id` int unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `products_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `products_distributor_id_foreign` FOREIGN KEY (`distributor_id`) REFERENCES `distributors` (`id`) ON DELETE CASCADE,
  CONSTRAINT `products_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `types` (`id`) ON DELETE CASCADE
) DELIMITER $ $ CREATE PROCEDURE `system_log`(userId int, typeId int, de text) RETURNS INT DETERMINISTIC BEGIN
INSERT INTO
  system_logs(
    user_id,
    logging_type_id,
    description,
    created_at
  )
VALUES
(userId, typeId, de, NOW());

RETURN 1;

END $ $ DELIMITER;

CREATE FUNCTION duocth_development.get_types_tree2() RETURNS JSON DETERMINISTIC BEGIN DECLARE types_tree JSON;

SELECT
  JSON_ARRAYAGG(
    JSON_OBJECT(
      'id',
      t.id,
      'name',
      t.name,
      'icon',
      t.icon,
      'children',
      (
        SELECT
          JSON_ARRAYAGG(JSON_OBJECT(
            'id', b.id,
            'name', b.name,
            'icon', b.icon,
            'quantity', (
              SELECT
                COUNT(*)
              FROM
                products p
              WHERE
                p.type_id = b.id
            )
          ))
        FROM types b
        WHERE b.p_id = t.id
      )
    ) 
  ) INTO types_tree
  FROM types t
  WHERE t.p_id IS NULL;
  RETURN types_tree;
END

DROP IF EXISTS TABLE `product_units`;
CREATE TABLE `product_units` (
  `product_id` int unsigned NOT NULL,
  `unit_from_id` int unsigned NOT NULL,
  `quantity_from` int unsigned NOT NULL,
  `unit_to_id` int unsigned NOT NULL,
  `quantity_to` int unsigned NOT NULL,
  PRIMARY KEY (`product_id`, `unit_from_id`, `unit_to_id`),
  CONSTRAINT `product_units_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_units_unit_from_id_foreign` FOREIGN KEY (`unit_from_id`) REFERENCES `units` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_units_unit_to_id_foreign` FOREIGN KEY (`unit_to_id`) REFERENCES `units` (`id`) ON DELETE CASCADE
)

CREATE PROCEDURE duocth_development.add_product(
  IN name VARCHAR(255),
  IN description TEXT,
  IN images TEXT,
  IN description_image TEXT,
  IN company_id INT,
  IN distributor_id INT,
  IN type_id INT,
  IN units TEXT
)
BEGIN
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'An error occurred, please try again later';
  END;

  START TRANSACTION;
    -- INSERT PRODUCT
    DECLARE product_id INT;
    INSERT INTO products(
      name,
      description,
      images,
      description_image,
      company_id,
      distributor_id,
      type_id,
      created_at
    )
    VALUES(
      name,
      description,
      images,
      description_image,
      company_id,
      distributor_id,
      type_id,
      NOW()
    );
    SET product_id = LAST_INSERT_ID();
    DECLARE i INT DEFAULT 0;
    DECLARE n INT DEFAULT JSON_LENGTH(units);
    DECLARE unit_json TEXT;

    WHILE i < n DO 
      SET unit_json = JSON_EXTRACT(units, CONCAT('$[', i, ']'));
      INSERT INTO product_units(
        product_id,
        unit_from_id,
        quantity_from,
        unit_to_id,
        quantity_to
      )
      VALUES(
        product_id,
        JSON_UNQUOTE(JSON_EXTRACT(unit_json, '$.idFrom')),
        JSON_UNQUOTE(JSON_EXTRACT(unit_json, '$.quantityFrom')),
        JSON_UNQUOTE(JSON_EXTRACT(unit_json, '$.idTo')),
        JSON_UNQUOTE(JSON_EXTRACT(unit_json, '$.quantityTo'))
      );
      SET i = i + 1;
    END WHILE;
    CALL system_log(1, 1, CONCAT('Thêm mặt hàng ', name));
  COMMIT;
END
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
          JSON_ARRAYAGG(
            JSON_OBJECT(
              'id',
              b.id,
              'name',
              b.name,
              'icon',
              b.icon,
              'quantity',
              (
                SELECT
                  COUNT(*)
                FROM
                  products p
                WHERE
                  p.type_id = b.id
              )
            )
          )
        FROM
          types b
        WHERE
          b.p_id = t.id
      )
    )
  ) INTO types_tree
FROM
  types t
WHERE
  t.p_id IS NULL;

RETURN types_tree;

END DROP IF EXISTS TABLE `product_units`;

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
) CREATE PROCEDURE duocth_development.add_product(
  IN name VARCHAR(255),
  IN description TEXT,
  IN images TEXT,
  IN description_image TEXT,
  IN company_id INT,
  IN distributor_id INT,
  IN type_id INT,
  IN units TEXT
) BEGIN DECLARE EXIT HANDLER FOR SQLEXCEPTION BEGIN ROLLBACK;

SIGNAL SQLSTATE '45000'
SET
  MESSAGE_TEXT = 'An error occurred, please try again later';

END;

START TRANSACTION;

-- INSERT PRODUCT
DECLARE product_id INT;

INSERT INTO
  products(
    name,
    description,
    images,
    description_image,
    company_id,
    distributor_id,
    type_id,
    created_at
  )
VALUES
(
    name,
    description,
    images,
    description_image,
    company_id,
    distributor_id,
    type_id,
    NOW()
  );

SET
  product_id = LAST_INSERT_ID();

DECLARE i INT DEFAULT 0;

DECLARE n INT DEFAULT JSON_LENGTH(units);

DECLARE unit_json TEXT;

WHILE i < n DO
SET
  unit_json = JSON_EXTRACT(units, CONCAT('$[', i, ']'));

INSERT INTO
  product_units(
    product_id,
    unit_from_id,
    quantity_from,
    unit_to_id,
    quantity_to
  )
VALUES
(
    product_id,
    JSON_UNQUOTE(JSON_EXTRACT(unit_json, '$.idFrom')),
    JSON_UNQUOTE(JSON_EXTRACT(unit_json, '$.quantityFrom')),
    JSON_UNQUOTE(JSON_EXTRACT(unit_json, '$.idTo')),
    JSON_UNQUOTE(JSON_EXTRACT(unit_json, '$.quantityTo'))
  );

SET
  i = i + 1;

END WHILE;

CALL system_log(1, 1, CONCAT('Thêm mặt hàng ', name));

COMMIT;

END DELETE TABLE IF EXISTS `storage`;

CREATE TABLE `storage` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned NOT NULL,
  `unit_id` int unsigned NOT NULL,
  `quantity` int unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `product_id` (`product_id`),
  CONSTRAINT `storage_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `storage_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE CASCADE
) CREATE TABLE `import_histories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned NOT NULL,
  `distributor_id` int unsigned NOT NULL,
  `unit_id` int unsigned NOT NULL,
  `quantity` int unsigned NOT NULL,
  `import_price` bigint unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `product_id` (`product_id`),
  INDEX `distributor_id` (`distributor_id`),
  CONSTRAINT `import_histories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `import_histories_distributor_id_foreign` FOREIGN KEY (`distributor_id`) REFERENCES `distributors` (`id`) ON DELETE CASCADE,
  CONSTRAINT `import_histories_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE CASCADE
) CREATE TABLE `price` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned NOT NULL,
  `unit_id` int unsigned NOT NULL,
  `price` bigint unsigned NOT NULL,
  `active` tinyint(1) DEFAULT 1,
  `using_from` datetime DEFAULT NULL,
  `stop_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `product_id` (`product_id`),
  CONSTRAINT `price_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `price_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE CASCADE
) CREATE FUNCTION duocth_development.get_product_import(product_id INT) RETURNS JSON BEGIN DECLARE r JSON;

DECLARE unit_obj JSON;

DECLARE quantity_by_unit JSON;

SELECT
  JSON_ARRAYAGG(
    JSON_OBJECT('id', u.id, 'name', u.name)
  ) INTO unit_obj
FROM
  product_units pu
  JOIN units u ON pu.unit_from_id = u.id
WHERE
  pu.product_id = product_id;

SELECT
  JSON_ARRAYAGG(
    JSON_OBJECT(
      'from_id',
      pu.unit_from_id,
      'to_id',
      pu.unit_to_id,
      'from_name',
      u.name,
      'to_name',
      u1.name,
      'base_quantity',
      s.quantity,
      'conversion_factor',
      pu.quantity_to / pu.quantity_from
    )
  ) INTO quantity_by_unit
FROM
  product_units pu
  JOIN units u ON pu.unit_from_id = u.id
  JOIN units u1 ON pu.unit_to_id = u1.id
  LEFT JOIN storage s ON s.product_id = pu.product_id
  AND s.unit_id = pu.unit_from_id
WHERE
  pu.product_id = product_id;

SELECT
  JSON_OBJECT(
    'units',
    unit_obj,
    'quantity_by_unit',
    quantity_by_unit,
    'product_name',
    p.name,
    'product_id',
    p.id,
    'image',
    p.description_image,
    'description',
    p.description
  ) INTO r
FROM
  products p
WHERE
  p.id = product_id;

RETURN r;

END CREATE PROCEDURE duocth_development.import_product(
  IN product_id INT,
  IN distributor_id INT,
  IN unit_id INT,
  IN quantity INT,
  IN import_price BIGINT
) BEGIN DECLARE product_exist INT;

DECLARE storage_id INT;

DECLARE storage_quantity INT;

SELECT
  COUNT(*)
FROM
  products
WHERE
  id = product_id
  AND active = 1 INTO product_exist;

IF product_exist = 0 THEN SIGNAL SQLSTATE '45000'
SET
  MESSAGE_TEXT = 'Mặt hàng không tồn tại hoặc đã bị xóa';

END IF;

INSERT INTO
  import_histories(
    product_id,
    distributor_id,
    unit_id,
    quantity,
    import_price,
    created_at
  )
VALUES
(
    product_id,
    distributor_id,
    unit_id,
    quantity,
    import_price,
    NOW()
  );

-- Check if product exist in storage
SELECT
  id,
  quantity
FROM
  storage
WHERE
  product_id = product_id
  AND unit_id = unit_id INTO storage_id,
  storage_quantity;

IF storage_id IS NULL THEN
INSERT INTO
  storage(
    product_id,
    unit_id,
    quantity,
    created_at
  )
VALUES
(
    product_id,
    unit_id,
    quantity,
    NOW()
  );

ELSE
UPDATE
  storage
SET
  quantity = storage_quantity + quantity
WHERE
  id = storage_id;

END IF;

END CREATE PROCEDURE duocth_development.import_products(
  IN distributor_id INT,
  IN import_products TEXT
) BEGIN DECLARE i INT DEFAULT 0;

DECLARE n INT DEFAULT JSON_LENGTH(import_products);

DECLARE product_json JSON;

DECLARE total_price BIGINT DEFAULT 0;

DECLARE EXIT HANDLER FOR SQLEXCEPTION BEGIN ROLLBACK;

SIGNAL SQLSTATE '45000'
SET
  MESSAGE_TEXT = 'An error occurred, please try again later';

END;

START TRANSACTION;

WHILE i < n DO
SET
  product_json = JSON_EXTRACT(import_products, CONCAT('$[', i, ']'));

CALL import_product(
  JSON_UNQUOTE(JSON_EXTRACT(product_json, '$.product_id')),
  distributor_id,
  JSON_UNQUOTE(JSON_EXTRACT(product_json, '$.unit')),
  JSON_UNQUOTE(JSON_EXTRACT(product_json, '$.quantity')),
  JSON_UNQUOTE(JSON_EXTRACT(product_json, '$.price'))
);

SET
  total_price = total_price + JSON_UNQUOTE(JSON_EXTRACT(product_json, '$.price'));

SET
  i = i + 1;

END WHILE;

CALL system_log(
  1,
  4,
  CONCAT(
    'Nhập hàng từ nhà phân phối ',
    distributor_id,
    ' với tổng giá trị ',
    total_price
  )
);

END 

CREATE FUNCTION duocth_development.get_storage_products(page_num INT, page_size INT) RETURNS JSON DETERMINISTIC BEGIN DECLARE r JSON;

DECLARE total INT;

DECLARE product_list JSON;

DECLARE offset_value INT;

-- Tính giá trị OFFSET cho phân trang
SET
  offset_value = (page_num - 1) * page_size;

-- Đếm tổng số sản phẩm (DISTINCT) có trạng thái `active = 1`
SELECT
  COUNT(DISTINCT s.product_id) INTO total
FROM
  storage s
  JOIN products p ON s.product_id = p.id
WHERE
  p.active = 1;

-- Truy vấn danh sách sản phẩm theo phân trang
SELECT
  JSON_ARRAYAGG(
    JSON_OBJECT(
      'id',
      fp.id,
      'name',
      fp.name,
      'image',
      fp.description_image,
      'unit',
      (
        SELECT
          JSON_ARRAYAGG(
            JSON_OBJECT(
              'id',
              u.id,
              'name',
              u.name,
              'quantity',
              s1.quantity
            )
          )
        FROM
          storage s1
          JOIN units u ON s1.unit_id = u.id
        WHERE
          s1.product_id = fp.id
      ),
      'price',
      (
        SELECT
          JSON_ARRAYAGG(
            JSON_OBJECT(
              'unit_id',
              pr.unit_id,
              'unit_name',
              u1.name,
              'price',
              pr.price
            )
          )
        FROM
          price pr
          JOIN units u1 ON pr.unit_id = u1.id
        WHERE
          pr.product_id = fp.id
          AND pr.active = 1
      ),
      'average_import_price',
      (
        SELECT
          JSON_OBJECT(
            'unit_name',
            u2.name,
            'average_import_price',
            ROUND(ih.import_price / ih.quantity)
          )
        FROM
          import_histories ih
          JOIN units u2 ON ih.unit_id = u2.id
        WHERE
          ih.product_id = fp.id
        ORDER BY
          ih.created_at DESC
        LIMIT
          1
      )
    )
  ) INTO product_list
FROM
  (
    SELECT
      DISTINCT p.id,
      p.name,
      p.description_image,
      (
        SELECT
          COUNT(1)
        FROM
          price pr
        WHERE
          pr.product_id = p.id
          AND pr.active = 1
          AND pr.price IS NOT NULL
      ) AS price_count,
      (
        SELECT
          MAX(s.created_at)
        FROM
          storage s
        WHERE
          s.product_id = p.id
      ) AS max_created_at
    FROM
      products p
      JOIN storage s ON s.product_id = p.id -- Chỉ lấy các sản phẩm có trong bảng storage
    WHERE
      p.active = 1
    ORDER BY
      price_count DESC,
      max_created_at DESC
    LIMIT
      offset_value, page_size
  ) AS fp;

-- Gộp kết quả cuối cùng
SELECT
  JSON_OBJECT(
    'total',
    total,
    'products',
    product_list
  ) INTO r;

RETURN r;

END;

CREATE PROCEDURE duocth_development.set_product_prices(
  IN pid INT,
  IN prices TEXT
)
BEGIN
    DECLARE i INT DEFAULT 0;
    DECLARE n INT DEFAULT JSON_LENGTH(prices);
    DECLARE price_json JSON;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'An error occurred, please try again later';
    END;

    START TRANSACTION;

    -- Cập nhật giá cũ về trạng thái `active = 0`
    -- UPDATE price SET active = 0, stop_at = NOW() WHERE product_id = pid;

    -- Thêm giá mới
    WHILE i < n DO
        SET price_json = JSON_EXTRACT(prices, CONCAT('$[', i, ']'));

        INSERT INTO price(product_id, unit_id, price, active, using_from)
        VALUES(
            pid,
            JSON_UNQUOTE(JSON_EXTRACT(price_json, '$.unit')),
            JSON_UNQUOTE(JSON_EXTRACT(price_json, '$.price')),
            1,
            NOW()
        );

        SET i = i + 1;
    END WHILE;

    CALL system_log(1, 5, CONCAT('Cập nhật giá cho mặt hàng ', pid));

    COMMIT;
END
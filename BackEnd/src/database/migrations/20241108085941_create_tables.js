/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
export const up = function(knex) {
  //tạo bảng roles
  return knex.schema.hasTable('roles').then(function(exists) {
    if(!exists) {
      return knex.schema.createTable('roles', function(table) {
        table.increments('id').primary();
        table.string('name').notNullable();
        table.string('description');
        table.timestamps();
      });
    }
  })
  //tạo bảng users
  .then(() => {
    return knex.schema.hasTable('users').then(function(exists) {
      if(!exists) {
        return knex.schema.createTable('users', function(table) {
          table.increments('id').primary();
          table.string('username').notNullable();
          table.string('password').notNullable();
          table.timestamps();
        });
      }
    });
  })
  //tạo bảng user_roles
  .then(() => {
    return knex.schema.hasTable('user_roles').then(function(exists) {
      if(!exists) {
        return knex.schema.createTable('user_roles', function(table) {
          table.integer('user_id').unsigned().references('id').inTable('users').onDelete('CASCADE');
          table.integer('role_id').unsigned().references('id').inTable('roles').onDelete('CASCADE');
          table.primary(['user_id', 'role_id']);
          table.timestamps();
        });
      }
    });
  })
  .then(()=>{
    return knex.schema.hasTable('menus').then(function(exists) {
      if(!exists) {
        return knex.schema.createTable('menus', function(table) {
          table.increments('id').primary();
          table.integer('p_id').unsigned().references('id').inTable('menus').onDelete('CASCADE');
          table.string('icon');
          table.string('name').notNullable();
          table.string('url').notNullable();
          table.timestamps();
        });
      }
    });
  })
};

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
export const down = function(knex) {
  return knex.schema.dropTableIfExists('user_roles')
    .then(() => knex.schema.dropTableIfExists('users'))
    .then(() => knex.schema.dropTableIfExists('roles')); 
};

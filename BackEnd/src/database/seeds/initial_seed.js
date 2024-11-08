

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> } 
 */
export const seed = async function(knex) {
  // Deletes ALL existing entries
  await knex('user_roles').del();
  await knex('users').del();
  await knex('roles').del();
  await knex('users').insert([
    {username: 'admin', password: '$argon2id$v=19$m=65536,t=2,p=1$BQ6KxBbrqMh/Bq/iQxvjRkb47sl36mDJVQaMvYyeqv4$ysm0tPpPawozFoxeVueFXwdfXVimjVZM2zFRacKjx8M'},
  ]);
  await knex('roles').insert([
    {name: 'admin', description: 'Administrator'},
    {name: 'user', description: 'User'},
  ]);
  await knex('user_roles').insert([
    {user_id: 1, role_id: 1},
  ]);
};

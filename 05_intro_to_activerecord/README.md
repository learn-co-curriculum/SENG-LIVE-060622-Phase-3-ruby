## 5. Intro to ActiveRecord
### SWBAT

- [ ] Review why we use Active Record
- [ ] Observe how to configure AR in Ruby applications
- [ ] Explain what a migration is 
- [ ] Observe creating & updating columns & tables w/ AR migrations
- [ ] Observe creating & updating rows w/ built in AR methods
- [ ] Observe how AR uses SQL “under the hood” to communicate with databases


# Steps for active record 
1. Create your migrations 
    `rake db:create_migration`
2. Build your table in your migration
    ```
    create_table :pets do |t|
      t.string :name
      t.integer :age
      t.string :breed
      t.string :image_url
    end 

    ```
3. migrate to db
    `rake db:migrate`
4. Check the schema!
5. Create your seeds!
    `rake db:seed`
class Dog
  attr_accessor :name, :breed, :id

  def initialize(name:,breed:,id:nil)
    @name=name
    @breed=breed
    @id=id
  end

  def self.create_table
    sql= <<-SQL
      CREATE TABLE IF NOT EXISTS dogs(
      id INTEGER PRIMARY KEY,
      name TEXT,
      breed TEXT
      )
      SQL
    DB[:conn].execute(sql)
  end

  def self.drop_table
    DB[:conn].execute("DROP TABLE IF EXISTS dogs")
  end

  def save

  end

  def self.create(name,breed)
    dog = Dog.new(name, breed)
  end

  def self.find_by_id

  end

  def self.find_or_create_by(a,b)

  end

  def self.new_from_db(row)
    name=row[1]
    breed=row[2]
    id=row[0]
    Dog.new(id:id, name:name, breed:breed)
  end

  def self.find_by_name
    sql= <<-SQL
      SELECT *
      FROM dogs
      WHERE name=?
      LIMIT 1
      SQL
    DB[:conn].execute(sql,@name)
  end

  def update

  end

end

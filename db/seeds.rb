Place.create!([
  {name: "Biblioteca"},
  {name: "Biblioteca2 "}
])
Type.create!([
  {name: "Tipo 1", :places => Place.where("name in ('Biblioteca','Biblioteca2')")},
  {name: "Tipo 2"},
  {name: "Tipo 3"}
])

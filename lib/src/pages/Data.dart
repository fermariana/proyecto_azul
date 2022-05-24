class Data {
  Data(
      {required this.descripcion,
      required this.imagen,
      this.key,
      required this.titulo,
      required this.direccion});

  String? key;
  String descripcion;
  String imagen;
  String titulo;
  String direccion;
}

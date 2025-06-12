import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Note extends StatefulWidget {
  const Note({super.key});

  @override
  State<Note> createState() => _NoteState();
}

class _NoteState extends State<Note> {
  // Controladores para los campos de texto
  final TextEditingController _idProductoController = TextEditingController();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _precioController = TextEditingController();
  final TextEditingController _descripcionController = TextEditingController();
  final TextEditingController _precioMayoreoController =
      TextEditingController();
  final TextEditingController _stackController = TextEditingController();
  final TextEditingController _demandaController = TextEditingController();
  final TextEditingController _idSucursalController = TextEditingController();

  @override
  void dispose() {
    // Liberar los controladores cuando el widget se destruye
    _idProductoController.dispose();
    _nombreController.dispose();
    _precioController.dispose();
    _descripcionController.dispose();
    _precioMayoreoController.dispose();
    _stackController.dispose();
    _demandaController.dispose();
    _idSucursalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Productos",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.amber,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Registro de Productos",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber,
                ),
              ),
              const SizedBox(height: 30),

              // Campo para ID Producto
              TextField(
                controller: _idProductoController,
                decoration: InputDecoration(
                  hintText: "ID Producto",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.amber.shade700,
                      width: 2.0,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 15,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Campo para Nombre
              TextField(
                controller: _nombreController,
                decoration: InputDecoration(
                  hintText: "Nombre del Producto",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.amber.shade700,
                      width: 2.0,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 15,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Campo para Precio
              TextField(
                controller: _precioController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Precio",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.amber.shade700,
                      width: 2.0,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 15,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Campo para Descripción
              TextField(
                controller: _descripcionController,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: "Descripción",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.amber.shade700,
                      width: 2.0,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 15,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Campo para Precio Mayoreo
              TextField(
                controller: _precioMayoreoController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Precio Mayoreo",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.amber.shade700,
                      width: 2.0,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 15,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Campo para Stack
              TextField(
                controller: _stackController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Stock",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.amber.shade700,
                      width: 2.0,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 15,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Campo para Demanda
              TextField(
                controller: _demandaController,
                decoration: InputDecoration(
                  hintText: "Demanda (Alta/Media/Baja)",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.amber.shade700,
                      width: 2.0,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 15,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Campo para ID Sucursal
              TextField(
                controller: _idSucursalController,
                decoration: InputDecoration(
                  hintText: "ID Sucursal",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.amber.shade700,
                      width: 2.0,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 15,
                  ),
                ),
              ),
              const SizedBox(height: 40),
ElevatedButton(
  onPressed: () async {
    try {
      await FirebaseFirestore.instance.collection('productos').add({
        'idProducto': _idProductoController.text,
        'nombre': _nombreController.text,
        'precio': double.tryParse(_precioController.text) ?? 0,
        'descripcion': _descripcionController.text,
        'precioMayoreo': double.tryParse(_precioMayoreoController.text) ?? 0,
        'stock': int.tryParse(_stackController.text) ?? 0,
        'demanda': _demandaController.text,
        'idSucursal': _idSucursalController.text,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Producto guardado exitosamente')),
      );

      _idProductoController.clear();
      _nombreController.clear();
      _precioController.clear();
      _descripcionController.clear();
      _precioMayoreoController.clear();
      _stackController.clear();
      _demandaController.clear();
      _idSucursalController.clear();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al guardar: $e')),
      );
    }
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: const Color.fromARGB(255, 230, 215, 240),
    foregroundColor: Colors.deepPurple,
    padding: const EdgeInsets.symmetric(vertical: 15),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25),
    ),
    elevation: 3,
  ),
  child: const Text(
    "Guardar Producto",
    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w200),
  ),
),

            ],
          ),
        ),
      ),
    );
  }
}

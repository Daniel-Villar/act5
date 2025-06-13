import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductosScreen extends StatefulWidget {
  const ProductosScreen({super.key});

  @override
  State<ProductosScreen> createState() => _ProductosScreenState();
}

class _ProductosScreenState extends State<ProductosScreen> {
  final TextEditingController idProductoController = TextEditingController();
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController precioController = TextEditingController();
  final TextEditingController descripcionController = TextEditingController();
  final TextEditingController precioMayoreoController = TextEditingController();
  final TextEditingController stackController = TextEditingController();
  final TextEditingController demandaController = TextEditingController();
  final TextEditingController idSucursalController = TextEditingController();

  Future<void> agregarProducto() async {
    // Validación básica para evitar campos vacíos
    if (idProductoController.text.trim().isEmpty ||
        nombreController.text.trim().isEmpty ||
        precioController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Por favor, complete los campos obligatorios (ID, Nombre y Precio).',
          ),
        ),
      );
      return;
    }

    try {
      await FirebaseFirestore.instance.collection('productos').add({
        'id_producto': idProductoController.text.trim(),
        'nombre': nombreController.text.trim(),
        'precio': double.tryParse(precioController.text.trim()) ?? 0.0,
        'descripcion': descripcionController.text.trim(),
        'precio_mayoreo':
            double.tryParse(precioMayoreoController.text.trim()) ?? 0.0,
        'stack': int.tryParse(stackController.text.trim()) ?? 0,
        'demanda': demandaController.text.trim(),
        'id_sucursal': idSucursalController.text.trim(),
        'timestamp': FieldValue.serverTimestamp(),
      });

      _limpiarControladores();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('¡Producto agregado exitosamente!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error al agregar producto: $e')));
    }
  }

  void _limpiarControladores() {
    idProductoController.clear();
    nombreController.clear();
    precioController.clear();
    descripcionController.clear();
    precioMayoreoController.clear();
    stackController.clear();
    demandaController.clear();
    idSucursalController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gestión de Productos"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 180, 98, 221),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                "Agregar Producto",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 68, 171, 255),
                ),
              ),
              const SizedBox(height: 15),

              // Campos del formulario
              TextField(
                controller: idProductoController,
                decoration: InputDecoration(
                  labelText: 'ID del Producto*',
                  hintText: 'Ingrese el ID único del producto',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 15),

              TextField(
                controller: nombreController,
                decoration: InputDecoration(
                  labelText: 'Nombre*',
                  hintText: 'Ingrese el nombre del producto',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              const SizedBox(height: 15),

              TextField(
                controller: precioController,
                decoration: InputDecoration(
                  labelText: 'Precio*',
                  hintText: 'Ingrese el precio al público',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 15),

              TextField(
                controller: descripcionController,
                decoration: InputDecoration(
                  labelText: 'Descripción',
                  hintText: 'Ingrese una descripción del producto',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                maxLines: 2,
              ),
              const SizedBox(height: 15),

              TextField(
                controller: precioMayoreoController,
                decoration: InputDecoration(
                  labelText: 'Precio Mayoreo',
                  hintText: 'Ingrese el precio para ventas al mayoreo',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 15),

              TextField(
                controller: stackController,
                decoration: InputDecoration(
                  labelText: 'Stock',
                  hintText: 'Ingrese la cantidad en inventario',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 15),

              TextField(
                controller: demandaController,
                decoration: InputDecoration(
                  labelText: 'Demanda',
                  hintText: 'Ingrese el nivel de demanda (Alta/Media/Baja)',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              const SizedBox(height: 15),

              TextField(
                controller: idSucursalController,
                decoration: InputDecoration(
                  labelText: 'ID Sucursal',
                  hintText: 'Ingrese el ID de la sucursal',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 15),

              ElevatedButton(
                onPressed: agregarProducto,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 168, 68, 255),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text('Guardar Producto'),
              ),

              const SizedBox(height: 20),
              const Divider(),
              const SizedBox(height: 10),

              const Text(
                "Inventario de Productos",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              const SizedBox(height: 10),

              StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance
                        .collection('productos')
                        .orderBy('timestamp', descending: true)
                        .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }
                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Center(
                      child: Text("No hay productos registrados."),
                    );
                  }

                  final docs = snapshot.data!.docs;

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: docs.length,
                    itemBuilder: (context, index) {
                      final doc = docs[index];
                      final data = doc.data() as Map<String, dynamic>;
                      final idProducto = data['id_producto'] ?? 'N/A';
                      final nombre = data['nombre'] ?? 'N/A';
                      final precio =
                          data['precio']?.toStringAsFixed(2) ?? '0.00';
                      final descripcion =
                          data['descripcion'] ?? 'Sin descripción';
                      final precioMayoreo =
                          data['precio_mayoreo']?.toStringAsFixed(2) ?? '0.00';
                      final stack = data['stack']?.toString() ?? '0';
                      final demanda = data['demanda'] ?? 'N/A';
                      final idSucursal = data['id_sucursal'] ?? 'N/A';

                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                nombre,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.deepPurple,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text("ID: $idProducto"),
                              Text("Precio: \$$precio"),
                              Text("Precio Mayoreo: \$$precioMayoreo"),
                              Text("Stock: $stack"),
                              Text("Demanda: $demanda"),
                              Text("Sucursal: $idSucursal"),
                              Text("Descripción: $descripcion"),

                              Align(
                                alignment: Alignment.bottomRight,
                                child: IconButton(
                                  onPressed: () {
                                    _mostrarDialogoEliminar(context, doc.id);
                                  },
                                  icon: const Icon(
                                    Icons.delete_forever,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _mostrarDialogoEliminar(BuildContext context, String docId) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text("Confirmar eliminación"),
            content: const Text(
              "¿Estás seguro de que quieres eliminar este producto?",
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancelar"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  FirebaseFirestore.instance
                      .collection('productos')
                      .doc(docId)
                      .delete()
                      .then((_) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Producto eliminado')),
                        );
                      })
                      .catchError((error) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Error al eliminar: $error')),
                        );
                      });
                },
                child: const Text(
                  "Eliminar",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
    );
  }
}

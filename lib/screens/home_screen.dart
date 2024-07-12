import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intership_assigment/bloc/items_bloc.dart';
import 'package:intership_assigment/screens/item_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.read<ItemsBloc>().add(LoadItems());

    return Scaffold(
      appBar: AppBar(
        title: Text('Items List'),
        backgroundColor: Colors.teal,  // Updated color
      ),
      body: BlocBuilder<ItemsBloc, ItemsState>(
        builder: (context, state) {
          if (state is ItemsLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ItemsLoaded) {
            if (state.items.isEmpty) {
              return Center(child: Text('No items available'));
            }

            return ListView.builder(
              itemCount: state.items.length,
              itemBuilder: (context, index) {
                final item = state.items[index];
                final imageUrl = item.img;

                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(10),
                    leading: Hero(
                      tag: 'image-${item.id}',  // Unique tag for the hero animation
                      child: Material(
                        borderRadius: BorderRadius.circular(8),
                        clipBehavior: Clip.hardEdge,
                        child: Image.network(
                          imageUrl,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(Icons.error, size: 50);
                          },
                        ),
                      ),
                    ),
                    title: Text(item.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    subtitle: Text(item.descriptions, overflow: TextOverflow.ellipsis),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ItemDetailScreen(item: item),
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (state is ItemsError) {
            return Center(child: Text('Error: ${state.error}'));
          } else {
            return Center(child: Text('No items available'));
          }
        },
      ),
    );
  }
}

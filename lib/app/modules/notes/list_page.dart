import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste/lib/app/data/provider/AdvanceProvider.dart';
import 'package:teste/lib/app/data/repository/AdvanceRepository.dart';
import 'package:teste/lib/app/modules/notes/controller.dart';

class AdvanceListPage extends GetView<AdvanceController> {
  final controller = Get.put(AdvanceController(AdvanceRepository(AdvanceProvider())));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GetX SQLite CRUD Tutorial')),
      body: Obx(() {
        //para testar melhor o loading, descomente a future delayed
        //no provider pra simular uma pequena demora no retorno da requisicao
        if (controller.loading.value == true) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          itemCount: controller.advanceList.length,
          itemBuilder: (BuildContext context, int index) => ListTile(
            title: Text('${controller.advanceList[index].title}'),
            trailing: Wrap(children: <Widget>[
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  controller.editAdvance(controller.advanceList[index]);
                },
              ),
              IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    Get.defaultDialog(
                        title: 'Excluir Nota',
                        middleText:
                        'Excluir nota de título ${controller.advanceList[index].title}?',
                        textCancel: 'Voltar',
                        onConfirm: () {
                          controller.deleteAdvance(controller.advanceList[index].id!);
                          if (controller.loading.value == true) {
                            Get.dialog(
                              Center(child: CircularProgressIndicator()),
                            );
                          }
                        });
                  }),
            ]),
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          controller.addAdvance();
        },
      ),
    );
  }
}
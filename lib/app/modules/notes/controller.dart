import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:teste/lib/app/data/model/AdvanceModel.dart';
// import 'package:teste/lib/app/data/repository/AdvanceRepository.dart';
// import 'package:teste/lib/app/modules/notes/edit_pages.dart';

class AdvanceController extends GetxController {
  final AdvanceRepository repository;
  AdvanceController(this.repository);

  //variavel do titulo
  String titulo = '';

  //variavel que controla o loading
  RxBool loading = false.obs;

  //variaveis da lista de notas
  final advanceList = <Advance>[].obs;

  //variaveis do form
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  FocusNode titleFocusNode = FocusNode();
  FocusNode contentFocusNode = FocusNode();

  //recuperar notas para apresentar na tela inicial
  @override
  void onReady() async {
    super.onReady();
    getAll();
  }

  //recuperar todas as notas
  getAll() {
    loading(true);
    repository.getAll().then((data) {
      advanceList.value = data;
      loading(false);
    });
  }

  //tratar formulario para inclusao de uma nota
  addAdvance() {
    formKey.currentState?.reset();
    nomeController.text = '';
    emailController.text = '';
    senhaController.text = '';
    alturaController.text = '';
    pesoController.text = '';
    idadeController.text = '';
    sexoController.text = '';
    objetivoController.text = '';
    caloriasController.text = '';
    atividadeController.text = '';
    titulo = 'Incluir Usuário';
    Get.to(() => AdvanceEditPage());
  }
  //tratar formulario para edicao de uma nota passando id via arguments
  editAdvance(Advance advance) {
    nomeController.text = advance.nome;
    emailController.text = advance.email;
    senhaController.text = advance.senha;
    alturaController.text = advance.altura;
    pesoController.text = advance.peso;
    idadeController.text = advance.idade;
    sexoController.text = advance.sexo;
    objetivoController.text = advance.objetivo;
    caloriasController.text = advance.calorias;
    atividadeController.text = advance.atividade;
    titulo = 'Editar Usuário';
    Get.to(() => AdvanceEditPage(), arguments: advance.id);
  }

  //verificar se o formulario esta validado sem erros
  //e se um id de nota eh enviado para a tela de edicao
  //a nota sera atualizada, caso contrario sera criada uma nova nota
  editMode() {
    contentFocusNode.unfocus();
    if (formKey.currentState!.validate()) {
      loading(true);
      if (Get.arguments == null) {
        saveAdvance();
      } else {
        updateAdvance();
      }
    }
  }

  //salvar uma nova nota
  saveAdvance() async {
    final advance = Advance(
      nome: nomeController.text.trim(),
      email: emailController.text.trim(),
      senha: senhaController.text.trim(),
      altura: alturaController.text.trim(),
      peso: pesoController.text.trim(),
      idade: idadeController.text.trim(),
      sexo: sexoController.text.trim(),
      objetivo: objetivoController.text.trim(),
      calorias: caloriasController.text.trim(),
      atividade: atividadeController.text.trim(),
    );
    repository.save(advance).then((data) {
      loading(false);
      refreshAdvanceList();
    });
  }

  //atualizar uma nota existente cujo id eh recuperado via arguments
  updateAdvance() async {
    final advance = Advance(
      id: Get.arguments,
      nome: nomeController.text.trim(),
      email: emailController.text.trim(),
      senha: senhaController.text.trim(),
      altura: alturaController.text.trim(),
      peso: pesoController.text.trim(),
      idade: idadeController.text.trim(),
      sexo: sexoController.text.trim(),
      objetivo: objetivoController.text.trim(),
      calorias: caloriasController.text.trim(),
      atividade: atividadeController.text.trim(),
    );
    repository.update(advance).then((data) {
      loading(false);
      refreshAdvanceList();
    });
  }

  //excluir nota via id
  deleteAdvance(int advanceId) async {
    loading(true);
    repository.delete(advanceId).then((data) {
      loading(false);
      refreshAdvanceList();
    });
  }

  // atualizar lista de notas apos uma inclusao, alteracao ou exclusao
  refreshAdvanceList() {
    // recuperar lista de notas
    getAll();
    //fechar dialog
    Get.back();
    //voltar para a lista de notas
    Get.back();
  }
  validarNome(String? value) {
    if (value == null  value.isEmpty) {
      return 'Preencha o campo Nome.';
    }
    return null;
  }

  validarEmail(String? value) {
    if (value == null  value.isEmpty) {
      return 'Preencha o campo Email.';
    }
    return null;
  }

  validarSenha(String? value) {
    if (value == null  value.isEmpty) {
      return 'Preencha o campo Senha.';
    }
    return null;
  }

  validarAltura(String? value) {
    if (value == null  value.isEmpty) {
      return 'Preencha o campo Altura.';
    }
    return null;
  }

  validarPeso(String? value) {
    if (value == null  value.isEmpty) {
      return 'Preencha o campo Peso.';
    }
    return null;
  }

  validarIdade(String? value) {
    if (value == null  value.isEmpty) {
      return 'Preencha o campo Idade.';
    }
    return null;
  }

  validarSexo(String? value) {
    if (value == null  value.isEmpty) {
      return 'Preencha o campo Sexo.';
    }
    return null;
  }

  validarObjetivo(String? value) {
    if (value == null  value.isEmpty) {
      return 'Preencha o campo Objetivo.';
    }
    return null;
  }

  validarCalorias(String? value) {
    if (value == null  value.isEmpty) {
      return 'Preencha o campo Calorias.';
    }
    return null;
  }

  validarAtividade(String? value) {
    if (value == null  value.isEmpty) {
      return 'Preencha o campo Atividade.';
    }
    return null;
  }

}

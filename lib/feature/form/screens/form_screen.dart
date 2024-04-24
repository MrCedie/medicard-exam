import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:medicard_exam/core/entities/user.dart';
import 'package:medicard_exam/feature/form/widgets/are_you_sure_dialog.dart';
import 'package:medicard_exam/feature/form/widgets/delete_button_widget.dart';
import 'package:medicard_exam/feature/list/bloc/user_bloc.dart';
import 'package:medicard_exam/feature/list/bloc/user_event.dart';

class FormScreenArgs {
  final UserEntity? user;
  final int? index;

  FormScreenArgs({this.user, this.index});
}

class FormScreen extends StatefulWidget {
  final FormScreenArgs? args;

  const FormScreen({super.key, this.args});
  static const routeName = 'list-item';
  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  late final UserBloc _bloc;
  bool _isUpdateForm = false;
  UserEntity? _initialValue;

  @override
  void initState() {
    final FormScreenArgs? args = widget.args;
    if (args?.index != null && args?.user != null) {
      _isUpdateForm = true;
      _initialValue = args?.user;
    }
    _bloc = BlocProvider.of<UserBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          _isUpdateForm ? 'Update User' : "Add User",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: FormBuilder(
          key: _formKey,
          child: ListView(
            children: [
              FormBuilderTextField(
                initialValue: _initialValue?.firstName ?? '',
                name: 'firstName',
                decoration: const InputDecoration(labelText: 'First Name'),
                validator: FormBuilderValidators.required(),
              ),
              const SizedBox(height: 10),
              FormBuilderTextField(
                initialValue: _initialValue?.middleName ?? '',
                name: 'middleName',
                decoration: const InputDecoration(labelText: 'Middle Name'),
              ),
              const SizedBox(height: 10),
              FormBuilderTextField(
                initialValue: _initialValue?.lastName ?? '',
                name: 'lastName',
                decoration: const InputDecoration(labelText: 'Last Name'),
                validator: FormBuilderValidators.required(),
              ),
              const SizedBox(height: 10),
              FormBuilderTextField(
                initialValue: _initialValue?.email ?? '',
                name: 'email',
                decoration: const InputDecoration(labelText: 'Email'),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.email()
                ]),
              ),
              const SizedBox(height: 30),

              // Submit Button
              ElevatedButton(
                onPressed: _handleSubmit,
                child: const Text('SUBMIT'),
              ),
              const SizedBox(height: 10),

              // Delete Button
              _isUpdateForm
                  ? DeleteBtnWidget(
                      onPressed: () => _handleDeleteUser(context),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }

  void _handleSubmit() {
    final formKey = _formKey.currentState;
    if (formKey?.saveAndValidate() != null) {
      final data = formKey!.value;
      final formData = UserEntity(
        firstName: data['firstName'] ?? '',
        middleName: data['middleName'] ?? '',
        lastName: data['lastName'] ?? '',
        email: data['email'] ?? '',
      );

      if (_isUpdateForm) {
        final index = widget.args!.index!;
        _bloc.add(UpdateUserEvent(formData, index));
        Navigator.pop(context);
        return;
      }
      _bloc.add(AddUserEvent(formData));
      Navigator.pop(context);
      return;
    }
  }

  Future _handleDeleteUser(BuildContext ctx) async {
    final result = await showDialog(
      context: context,
      builder: (BuildContext context) => const Dialog(
        child: AreYouSureDialog(),
      ),
    );

    if (result) {
      final index = widget.args!.index!;
      _bloc.add(DeleteUserEvent(index));
      if (!ctx.mounted) return;
      Navigator.pop(ctx);
      return;
    }
  }
}

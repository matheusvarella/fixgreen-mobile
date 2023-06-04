import 'package:fixgreen/android/styles.dart';
import 'package:fixgreen/android/views/home.view.dart';
import 'package:fixgreen/models/truck.model.dart';
import 'package:fixgreen/repositories/truck.repository.dart';
import 'package:flutter/material.dart';

class EditorTruckView extends StatefulWidget{
  final TruckModel? model;

  EditorTruckView({this.model});

  @override
  _EditorTruckViewState createState() => _EditorTruckViewState();
}

class _EditorTruckViewState extends State<EditorTruckView> {
  final _scaffoldkey = new GlobalKey<ScaffoldState>();
  final _formKey = new GlobalKey<FormState>();
  final _repository = TruckRepository();

  onSubmit() {
    if (!_formKey.currentState!.validate()) {
      return "";
    }
  }

  create() {
    _repository.create(widget.model!).then((_) {
      onSucess();
    }).catchError((_) {
      onError();
    });
  }

  update() {

  }

  onSucess() {
    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (context) => HomeView()
      ),
    );
  }

  onError() {
    final snackBar = SnackBar(
      content: Text("Ops, algo deu errado!")
    );
    //_scaffoldkey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        title: widget.model?.id == 0 ? Text("Novo caminhão") : Text("Editar caminhão"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 10,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Modelo",
                ),
                keyboardType: TextInputType.text,
                initialValue: widget.model?.model,
                onChanged: (val) {
                  widget.model?.model = val;
                },
                validator: (value) {
                  if (value == "") {
                    return "Modelo inválido";
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Marca",
                ),
                keyboardType: TextInputType.text,
                initialValue: widget.model?.brand,
                onChanged: (val) {
                  widget.model?.brand = val;
                },
                validator: (value) {
                  if (value == "") {
                    return "Marca inválida";
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Placa",
                ),
                keyboardType: TextInputType.text,
                initialValue: widget.model?.plate,
                onChanged: (val) {
                  widget.model?.plate = val;
                },
                validator: (value) {
                  if (value == "") {
                    return "Placa inválido";
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Ano",
                ),
                keyboardType: TextInputType.number,
                initialValue: widget.model?.year != null ? widget.model!.year.toString() : "",
                onChanged: (val) {
                  if (val.isNotEmpty) {
                    widget.model?.year = int.parse(val);
                  } else {
                    widget.model?.year = null;
                  }
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Ano inválido";
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Combustível",
                ),
                keyboardType: TextInputType.text,
                initialValue: widget.model?.fuel,
                onChanged: (val) {
                  widget.model?.fuel = val;
                },
                validator: (value) {
                  if (value == "") {
                    return "Combustível inválido";
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Média por litro",
                ),
                keyboardType: TextInputType.number,
                initialValue: widget.model?.averageKm != null ? widget.model!.averageKm.toString() : "",
                onChanged: (val) {
                  if (val.isNotEmpty) {
                    widget.model?.averageKm = double.parse(val);
                  } else {
                    widget.model?.averageKm = null;
                  }
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Média inválida";
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Carbono por km (kg)",
                ),
                keyboardType: TextInputType.number,
                initialValue: widget.model?.carbonKm != null ? widget.model!.carbonKm.toString() : "",
                onChanged: (val) {
                  if (val.isNotEmpty) {
                    widget.model?.carbonKm = double.parse(val);
                  } else {
                    widget.model?.carbonKm = null;
                  }
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Ano inválido";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 50,
                child: TextButton.icon(
                  onPressed: onSubmit,
                  icon: Icon(
                    Icons.save,
                    color: accentColor,
                  ),
                  label: Text(
                    "Salvar",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
            ],
          )
        )
      ),
    );
  }
}
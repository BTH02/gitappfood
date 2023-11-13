import 'package:appfood/constants/regex.dart';
import 'package:appfood/pages/login/widgets/login_sns.dart';
import 'package:appfood/routes/routes.dart';
import 'package:appfood/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  void dispose() {

    _phoneNumber.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const title = SizedBox(
      height: 200,
      child: Center(
          child: Text(
        "Đăng nhập",
        style: TextStyle(fontSize: 30),
      )),
    );
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          title,
          _buildInputPhoneNumber(),
          const SizedBox(height: 5),
          _buildInputPassword(),
          const SizedBox(height: 10),
          _buildLoginButton(),
          const SizedBox(height: 10),
          _buildSignUpButton(),
          const LoginSns(),
        ],
      ),
    );
  }

  Widget _buildInputPhoneNumber() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [boxShadow()],
      ),
      child: TextField(
        controller: _phoneNumber,
        decoration: const InputDecoration(
          hintText: "Số điện thoại",
          prefixIcon: Icon(Icons.phone),
        ),
        inputFormatters: [
          FilteringTextInputFormatter.deny(blockSpace),
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(10),
        ],
      ),
    );
  }

  Widget _buildInputPassword(){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [boxShadow()],
      ),
      child: TextFormField(
        controller: _password,
        decoration: const InputDecoration(
          hintText: "Mật khẩu",
          prefixIcon: Icon(Icons.lock),
        ),
      ),
    );
  }
  Widget _buildLoginButton() {
    return SizedBox(
      width: 300,
      height: 40,
      child: ElevatedButton(
          onPressed: () {
            // context.read<LoginBloc>().add(FillPhoneNumber(_phoneNumber.text));
            if(_phoneNumber.text=="0123456789"&&_password.text=="123"){
              Navigator.pushNamed(context, Routes.home);
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Đăng nhập thành công!"),
                duration: Duration(seconds: 2),
              ));
            }else{
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Số điện thoại hoặc mật khẩu không chính xác!"),
                duration: Duration(seconds: 2),
              ));
            }
          },
          child: const Text("Đăng nhập")),
    );
  }

  Widget _buildSignUpButton() {
    return SizedBox(
      width: 300,
      height: 40,
      child: ElevatedButton(onPressed: () {}, child: const Text("Đăng kí")),
    );
  }
}

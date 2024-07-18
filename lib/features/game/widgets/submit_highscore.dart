import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geoking/components/custom_button.dart';
import 'package:geoking/features/game/bloc/game_bloc.dart';

class SubmitHighscore extends StatefulWidget {
  const SubmitHighscore({super.key});

  @override
  State<SubmitHighscore> createState() => _SubmitHighscoreState();
}

class _SubmitHighscoreState extends State<SubmitHighscore> {
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameBloc, GameState>(
      builder: (context, state) {
        if (!state.isHighscore) {
          return const SizedBox();
        }

        return Column(
          children: [
            const Text(
              'You got a HIGHSCORE! Please, enter your name to join the leaderboards!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  child: TextFormField(
                    onFieldSubmitted: (value) {
                      if (value.isEmpty) return;

                      context.read<GameBloc>().add(GameNameSubmitted(name: value.trim()));
                    },
                    onTapOutside: (event) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    controller: nameController,
                    decoration: const InputDecoration(
                      hintText: 'Type your name',
                      contentPadding: EdgeInsets.only(
                        left: 8,
                        right: 8,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                    ),
                    cursorColor: Colors.black,
                    cursorHeight: 16,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(8),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                CustomButton(
                  onPressed: () {
                    if (nameController.text.isEmpty || nameController.text.length <= 3) return;

                    context.read<GameBloc>().add(GameNameSubmitted(name: nameController.text.trim()));
                  },
                  text: 'Send',
                  fontSize: 20,
                  maximumSize: const Size.fromWidth(100),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

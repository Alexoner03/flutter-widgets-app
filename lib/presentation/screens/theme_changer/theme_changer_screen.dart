import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {

  static const name = 'theme_changer_screen';

  const ThemeChangerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final isDarkMode = ref.watch(isDarkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("theme changer"),
        actions: [
          IconButton(
              onPressed: () {
                ref.read(isDarkModeProvider.notifier).update((state) => !state);
              },
              icon: Icon(isDarkMode ? Icons.dark_mode_outlined : Icons.light_mode_outlined))
        ],
      ),
      body: const SizedBox(
        child: _ThemeChangerView(),
      ),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    
    final List<Color> colors = ref.watch(colorsProvider);
    final selectedColor = ref.watch(selectedColorProvider);
    
    return ListView.builder(
        itemCount: colors.length,
        itemBuilder: (context, index) {
          final color = colors[index];
          return RadioListTile(
              title: Text("Este color", style: TextStyle(color: color)),
              subtitle: Text('${color.value}'),
              activeColor: color,
              value: index,
              groupValue: selectedColor,
              onChanged: (value) {
                ref.read(selectedColorProvider.notifier).update((state) => state = value!);
              },
          );
        }
    );
  }
}


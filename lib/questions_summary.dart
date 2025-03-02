import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              final isCorrect = data["user_answer"] == data["correct_answer"];
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 8.0),
                    decoration: BoxDecoration(
                        color: isCorrect ? Colors.blue[300]  : const Color.fromARGB(213, 248, 97, 148),
                        shape: BoxShape.circle),
                    child: Text(
                      ((data["question_index"] as int) + 1).toString(),
                      style: GoogleFonts.lato(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  const SizedBox(width: 20.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data["questions"] as String,
                          style: GoogleFonts.lato(
                              fontSize: 18.0, color: Colors.white),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          data["user_answer"] as String,
                          style: GoogleFonts.lato(
                            color: Colors.grey,
                            fontSize: 15.0,
                          ),
                        ),
                        Text(data["correct_answer"] as String,
                            style: GoogleFonts.lato(
                              color: const Color.fromARGB(255, 127, 159, 190),
                              fontSize: 15.0,
                            )),
                      ],
                    ),
                  )
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}

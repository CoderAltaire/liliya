import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../common/color_extenstion.dart';

class BookReadingView extends StatefulWidget {
  final String title;
  final String creator;
  final String publicator;
  final String language;
  final String ISBN;
  final String Country;
  final String description;
  final String imgPath;
  final String category;
  final String category_id;
  final String id;
  final String contributor;
  final String coverage;
  final String date;
  final String format;
  final String relation;
  final String subject;
  final String type;

  const BookReadingView({
    super.key,
    required this.title,
    required this.creator,
    required this.publicator,
    required this.language,
    required this.ISBN,
    required this.Country,
    required this.description,
    required this.imgPath,
    required this.category,
    required this.category_id,
    required this.id,
    required this.contributor,
    required this.coverage,
    required this.date,
    required this.format,
    required this.relation,
    required this.subject,
    required this.type,
  });

  @override
  State<BookReadingView> createState() => _BookReadingViewState();
}

class _BookReadingViewState extends State<BookReadingView> {
  double fontSize = 20;
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDark ? Colors.black : Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              pinned: true,
              floating: false,
              backgroundColor: isDark ? Colors.black : Colors.white,
              elevation: 0,
              title: Text(
                widget.title,
                style: TextStyle(
                  color: isDark ? Colors.white : TColor.text,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios, color: TColor.primary),
              ),
              actions: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Switch(
                      activeColor: TColor.primary,
                      value: isDark,
                      onChanged: (value) {
                        setState(() {
                          isDark = value;
                        });
                      },
                    ),
                    Text(
                      "Dark",
                      style: TextStyle(
                        color: isDark ? Colors.white : TColor.text,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          isScrollControlled: true,
                          builder: (context) {
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 20,
                                horizontal: 25,
                              ),
                              decoration: BoxDecoration(
                                color: isDark ? Colors.grey[900] : Colors.white,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(35),
                                  topRight: Radius.circular(35),
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Font Size",
                                    style: TextStyle(
                                      color:
                                          isDark ? Colors.white : TColor.text,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Slider(
                                    activeColor: TColor.primary,
                                    value: fontSize,
                                    min: 12,
                                    max: 40,
                                    onChanged: (value) {
                                      setState(() {
                                        fontSize = value;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      icon: Icon(Icons.text_fields, color: TColor.primary),
                    ),
                  ],
                ),
              ],
            ),
          ];
        },
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      widget.imgPath,
                      width: 120,
                      height: 180,
                      fit: BoxFit.cover,
                      errorBuilder:
                          (context, error, stackTrace) => Container(
                            width: 120,
                            height: 180,
                            color: Colors.grey[300],
                            child: const Icon(Icons.error),
                          ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BookDetailRow(
                          label: "Author",
                          value: widget.creator,
                          isDark: isDark,
                        ),
                        const SizedBox(height: 8),
                        BookDetailRow(
                          label: "Publication",
                          value: widget.publicator,
                          isDark: isDark,
                        ),
                        const SizedBox(height: 8),
                        BookDetailRow(
                          label: "Language",
                          value: widget.language,
                          isDark: isDark,
                        ),
                        const SizedBox(height: 8),
                        BookDetailRow(
                          label: "ISBN",
                          value: widget.ISBN,
                          isDark: isDark,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: isDark ? Colors.grey[900] : Colors.grey[100],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BookDetailRow(
                      label: "Category",
                      value: widget.category,
                      isDark: isDark,
                    ),
                    const SizedBox(height: 8),
                    BookDetailRow(
                      label: "Date",
                      value: widget.date,
                      isDark: isDark,
                    ),
                    const SizedBox(height: 8),
                    BookDetailRow(
                      label: "Format",
                      value: widget.format,
                      isDark: isDark,
                    ),
                    const SizedBox(height: 8),
                    BookDetailRow(
                      label: "Subject",
                      value: widget.subject,
                      isDark: isDark,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Description",
                style: TextStyle(
                  color: isDark ? Colors.white : TColor.text,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              SelectableText(
                widget.description,
                style: TextStyle(
                  color: isDark ? Colors.white : TColor.text,
                  fontSize: fontSize,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void updateUi() {
    setState(() {});
  }
}

class BookDetailRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isDark;

  const BookDetailRow({
    Key? key,
    required this.label,
    required this.value,
    required this.isDark,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$label: ",
          style: TextStyle(
            color: isDark ? Colors.white : TColor.text,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              color: isDark ? Colors.white70 : TColor.text.withOpacity(0.8),
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}

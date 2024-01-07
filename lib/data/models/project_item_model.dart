// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProjectItem {
  final String title;
  final String label;
  final String subtitle;
  final String? body;
  final List<String> imageList;

  ProjectItem({required this.title, required this.label, required this.subtitle, required this.imageList, this.body});

  ProjectItem copyWith({
    String? title,
    String? label,
    String? subtitle,
    String? body,
    List<String>? imageList,
  }) {
    return ProjectItem(
      title: title ?? this.title,
      label: label ?? this.label,
      subtitle: subtitle ?? this.subtitle,
      body: body ?? this.body,
      imageList: imageList ?? this.imageList,
    );
  }
}

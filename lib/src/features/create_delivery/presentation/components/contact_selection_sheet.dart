import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';

class ContactSelectionSheet extends StatefulWidget {
  final Function(Contact) onContactSelected;
  final String? selectedContactId;

  const ContactSelectionSheet({super.key, required this.onContactSelected, this.selectedContactId});

  @override
  State<ContactSelectionSheet> createState() => _ContactSelectionSheetState();
}

class _ContactSelectionSheetState extends State<ContactSelectionSheet> {
  List<Contact>? contacts;
  bool isLoading = true;
  String? error;
  String searchQuery = '';
  String? selectedContactId;
  Contact? selectedContact;

  @override
  void initState() {
    super.initState();
    selectedContactId = widget.selectedContactId;
    _loadContacts();
  }

  Future<void> _loadContacts() async {
    try {
      setState(() {
        isLoading = true;
        error = null;
      });

      if (!await FlutterContacts.requestPermission()) {
        setState(() {
          error = 'Доступ к контактам запрещен';
          isLoading = false;
        });
        return;
      }

      // Load contacts with phone numbers
      final loadedContacts = await FlutterContacts.getContacts(withProperties: true, withPhoto: false);

      // Filter contacts that have phone numbers
      final contactsWithPhones = loadedContacts.where((contact) => contact.phones.isNotEmpty).toList();

      // Sort by display name
      contactsWithPhones.sort((a, b) => a.displayName.compareTo(b.displayName));

      setState(() {
        contacts = contactsWithPhones;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        error = 'Ошибка загрузки контактов: $e';
        isLoading = false;
      });
    }
  }

  List<Contact> get filteredContacts {
    if (contacts == null || searchQuery.isEmpty) {
      return contacts ?? [];
    }
    return contacts!
        .where(
          (contact) =>
              contact.displayName.toLowerCase().contains(searchQuery.toLowerCase()) ||
              contact.phones.any((phone) => phone.number.contains(searchQuery)),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Content
        Expanded(child: _buildContent()),

        if (selectedContact != null)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      context.pop();
                      widget.onContactSelected(selectedContact!);
                    },
                    child: Text(
                      'Выбрать контакт',
                      style: context.typography.interText16.copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildContent() {
    if (isLoading) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.8,
        child: const Center(child: CircularProgressIndicator()),
      );
    }

    if (error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 48, color: context.colors.red),
            SizedBox(height: 16),
            Text(
              error!,
              style: context.typography.interText16.copyWith(color: context.colors.red),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            ElevatedButton(onPressed: _loadContacts, child: Text('Повторить')),
          ],
        ),
      );
    }

    final displayContacts = filteredContacts;

    if (displayContacts.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.contacts_outlined, size: 48, color: context.colors.textGray),
            SizedBox(height: 16),
            Text(
              searchQuery.isEmpty ? 'Контакты не найдены' : 'Нет результатов поиска',
              style: context.typography.interText16.copyWith(color: context.colors.textGray),
            ),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: ListView.separated(
            physics: ClampingScrollPhysics(),
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: displayContacts.length,
            separatorBuilder: (context, index) => Divider(color: context.colors.textGray, height: 1),
            itemBuilder: (context, index) {
              final contact = displayContacts[index];
              final primaryPhone = contact.phones.isNotEmpty ? contact.phones.first.number : '';

              return RadioListTile<Contact>(
                controlAffinity: ListTileControlAffinity.trailing,
                value: contact,
                groupValue: selectedContact,
                onChanged: (contact) {
                  setState(() {
                    selectedContact = contact;
                  });
                },
                contentPadding: EdgeInsets.zero,
                title: Text(
                  contact.displayName,
                  style: context.typography.interText14.copyWith(
                    color: context.colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: primaryPhone.isNotEmpty
                    ? Text(primaryPhone, style: context.typography.interText12.copyWith(color: context.colors.textGray))
                    : null,
                activeColor: context.colors.blue,
              );
            },
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}

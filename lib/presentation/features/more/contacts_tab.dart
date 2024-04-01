import 'package:beta_sms_mobile/data/models/responses/contact_group_item.dart';
import 'package:beta_sms_mobile/presentation/features/more/subviews/contact_card.dart';
import 'package:beta_sms_mobile/presentation/features/more/vm/more_providers.dart';
import 'package:beta_sms_mobile/presentation/theme/colors.dart';
import 'package:beta_sms_mobile/presentation/utils/app_dropdown.dart';
import 'package:beta_sms_mobile/presentation/utils/input_fields.dart';
import 'package:beta_sms_mobile/presentation/utils/line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ContactsTab extends ConsumerStatefulWidget {
  const ContactsTab({
    super.key,
  });

  @override
  ConsumerState<ContactsTab> createState() => _ContactsTabState();
}

class _ContactsTabState extends ConsumerState<ContactsTab> {
  final GlobalKey<State> _key = GlobalKey();

  ///
  final TextEditingController _listName = TextEditingController();
  ContactGroupItem _selectedGroup = ContactGroupItem();

  ///
  //final GlobalKey<State> _keyA = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final contactList = ref.watch(getContactGroupsByUserProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: contactList.maybeWhen(
        data: (data) {
          List<String> items = data.map((e) => e.name ?? "").toList();
          if (data.isEmpty) {
            return const Center(
              child: Text("You do not have any Contact List"),
            );
          } else {
            // setState(() {
            //   _listName.text = items.first;
            //   _selectedGroup =
            //       data.where((element) => element.name == _listName.text).first;
            // });
            final contactListItems =
                ref.watch(getContactsByGroupProvider(_selectedGroup.id ?? ""));
            return Column(
              children: [
                SizedBox(height: 20.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ListInput(
                    textKey: _key,
                    fieldName: 'Select List Name',
                    controller: _listName,
                    hint: '',
                    inputType: TextInputType.name,
                    validator: null,
                    onPressed: () async {
                      await platformSpecificDropdown(
                        key: _key,
                        context: context,
                        items: items,
                        value: _selectedGroup.name ?? "",
                        onChanged: (newValue) {
                          setState(() {
                            _listName.text = newValue ?? "";
                            _selectedGroup = data
                                .where((element) => element.name == newValue)
                                .first;
                            //ref.invalidate(getAccountDetailsProvider);
                            //print(_selectedGroup.id);
                            //ref.watch(getContactsByGroupProvider());
                          });
                        },
                      );
                    },
                  ),
                ),
                SizedBox(height: 30.h),
                contactListItems.maybeWhen(
                    data: (data) {
                      if (data.isEmpty) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 20,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.kWhite,
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          child: const Center(
                            child: Text("Select a Contact Group"),
                          ),
                        );
                      } else {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 20,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.kWhite,
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          child: MediaQuery.removePadding(
                            context: context,
                            removeTop: true,
                            removeBottom: true,
                            child: ListView.separated(
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                var value = data[index];
                                return ContactCard(
                                  contactName: value.name ?? "",
                                  phoneNo: '+${value.phoneNumber}',
                                  listName: _selectedGroup.name ?? "",
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const Line(thick: 2);
                              },
                              itemCount: data.length,
                            ),
                          ),
                        );
                      }
                    },
                    error: (error, stackTrace) => Center(
                          child: Text(
                            error.toString(),
                          ),
                        ),
                    orElse: () => const Center(
                          child: SpinKitRipple(
                            color: AppColors.kDarkBlue,
                          ),
                        )),
              ],
            );
          }
        },
        error: (error, stackTrace) => Center(
          child: Text(
            error.toString(),
          ),
        ),
        orElse: () => const Center(
          child: SpinKitRipple(
            color: AppColors.kDarkBlue,
          ),
        ),
      ),
    );
  }
}

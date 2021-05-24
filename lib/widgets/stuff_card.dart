import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:memstuff_manha/models/stuff_model.dart';
import '../helpers/date_helper.dart';

class StuffCard extends StatelessWidget {
  final StuffModel stuff;
  final Function onUpdate;
  final Function onDelete;
  final Function makePhoneCall;

  const StuffCard({
    Key key,
    this.stuff,
    this.onUpdate,
    this.onDelete,
    this.makePhoneCall,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.25,
        child: _buildCard(),
        actions: <Widget>[
          IconSlideAction(
            caption: 'Excluir',
            color: Theme.of(context).accentColor,
            icon: Icons.delete,
            onTap: onDelete,
          ),
        ],
        secondaryActions: <Widget>[
          IconSlideAction(
            caption: 'Ligar',
            color: Theme.of(context).accentColor,
            icon: Icons.phone,
            onTap: makePhoneCall,
          ),
        ]);
  }

  _buildCard() {
    return AnimationConfiguration.staggeredList(
        position: 0,
        duration: const Duration(milliseconds: 500),
        child: SlideAnimation(
            horizontalOffset: 500.0,
            child: FadeInAnimation(
                child: InkWell(
              onTap: onUpdate,
              child: Container(
                child: ListTile(
                  title: Text(stuff.description ?? ''),
                  subtitle: Text(stuff.contactName ?? ''),
                  trailing: Container(
                    padding: const EdgeInsets.only(top: 8),
                    height: double.infinity,
                    child: Text(DateHelper.relative(stuff.date)),
                  ),
                  leading: CircleAvatar(
                    backgroundImage: stuff.hasPhoto
                        ? FileImage(File(stuff.photoPath))
                        : null,
                    child: stuff.hasPhoto ? null : Text(stuff.description[0]),
                  ),
                ),
              ),
            ))));
  }
}

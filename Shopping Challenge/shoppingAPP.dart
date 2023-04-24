import 'dart:io';

void main() {
  Structure structure = new Structure();
  structure.order();
}

class Structure {
  // user ballance wallet
  var inputBallance;
  // Sum of all items
  int total_sum = 0;
  // add items to an empty array
  List<String> list_items = [];
  // add price of items to an empty array
  List<int> list_items_Sumprice = [];
  // price to all list to array
  List<int> order_list_price = [];

  order() {
    print(
        'Welcom new user your current ballance is low please \n Press 1 to add ');
    int opt = int.parse(stdin.readLineSync()!);
    if (opt == 1) {
      print('Add balance now to proceed');
      inputBallance = int.parse(stdin.readLineSync()!);
      print('Current ballance $inputBallance% \n 1. To make oders');
      int opt1 = int.parse(stdin.readLineSync()!);
      if (opt1 == 1) {
        print('');
        list_Oder();
      } else {
        print('Wrong input');
        inputBallance = 0;
        order();
      }
    } else {
      print('Wrong input');
      order();
    }
  }

  list_Oder() {
    List<String> order_list = [
      'Cloths 356%',
      'Iphone 12 pro 1890%',
      'Mirro 440%',
      'Chairs 500%',
      'Clipper 1000%',
      'Trouser 100%',
      'Samsumg phone 989%',
      'Car 7896%',
      'Pot 87%',
      'Flash 129%',
      'Fan 333%'
    ];
    order_list_price = [
      356,
      1890,
      440,
      500,
      1000,
      100,
      989,
      7896,
      87,
      129,
      333
    ];

    for (int a = 1; a < order_list.length; a++) {
      print('$a. ' + order_list[a] + '\n');
    }

    int optList = int.parse(stdin.readLineSync()!);
    if (optList > 10) {
      print('Wrong input');
      list_Oder();
    }
    // add items to an empty array
    list_items.add(order_list[optList]);
    // add price of items to an empty array
    list_items_Sumprice.add(order_list_price[optList]);
    print(order_list[optList] + ' have been added to cart\n');

    while (true) {
      print('1. To make more oders\n2. To see your oders\n3. To make payment');
      int show_chat_list = int.parse(stdin.readLineSync()!);
      if (show_chat_list == 2) {
        print('');
        showMy_cart();
      } else if (show_chat_list == 1) {
        print('');
        list_Oder();
      } else if (show_chat_list == 3) {
        print('');
        payment();
      }
      print('Wrong input');
    }
  }

  showMy_cart() {
    print('\n   Your orders   ');
    for (int b = 0; b < list_items.length; b++) {
      print('$b. ' + list_items[b] + '\n');
    }

    print('1. To add more items\n2. To delete items\n3. To make payment');

    int opt2 = int.parse(stdin.readLineSync()!);
    if (opt2 == 1) {
      list_Oder();
    } else if (opt2 == 2) {
      delete_Items();
    } else if (opt2 == 3) {
      payment();
    } else {
      print('Wrong input');
      showMy_cart();
    }
  }

  payment() {
    int total_shopping_price = 0;
    for (total_shopping_price in list_items_Sumprice) {
      total_sum += total_shopping_price;
    }

    print(
        'Your total Sum its  $total_sum%\n \n1. To delete more items\n2. Continue payment');
    int opt3 = int.parse(stdin.readLineSync()!);

    if (opt3 == 1) {
      total_sum = 0;
      delete_Items();
    } else if (opt3 == 2) {
      if (inputBallance >= total_sum) {
        inputBallance = inputBallance - total_sum;
        print(
            'Payment successful \n  Current balance  $inputBallance\n \n1. To purchase more items \n2. Back\n3. Exit');
        int opt4 = int.parse(stdin.readLineSync()!);
        if (opt4 == 1) {
          list_items_Sumprice.clear();
          list_items.clear();
          total_sum = 0;
          list_Oder();
        } else if (opt4 == 2) {
          payment();
        } else if (opt4 == 3) {
          exit(0);
        }
      } else {
        print(
            ' Payment decliend not enough money on your wallet\n please try deleting some items to procceed\n Money in your wallet $inputBallance%\n\n');

        total_sum = 0;
        payment();
      }
    } else {
      print('Wrong input');
      total_sum = 0;
      payment();
    }
  }

  delete_Items() {
    if (list_items.length < 1) {
      print(' Items have not been added \n Add Items from Items list');
      list_items_Sumprice.clear();
      list_Oder();
    }
    print('\n   Which item do you which to delete?   ');
    for (int b = 0; b < list_items.length; b++) {
      print('$b. ' + list_items[b] + '\n');
    }
    int opt3 = int.parse(stdin.readLineSync()!);
    if (opt3 > list_items.length) {
      print('Item Number  $opt3  Dose not exit try again');
      delete_Items();
    }
    print(list_items[opt3] + ' have been deleted succesfully');
    list_items.remove(list_items[opt3]);
    list_items_Sumprice.remove(list_items_Sumprice[opt3]);

    showMy_cart();
  }
}

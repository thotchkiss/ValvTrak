function noSpecialCharacters() {
    var key = pressed();
    var allowKey = true;
    if (!((key >= 48 && key <= 57) || (key >= 65 && key <= 90) || (key >= 97 && key <= 122) || (key == 32))) {
        allowKey = false;
    }

    return returnKeyCode(allowKey);
}

function allButApostrophe() {
    var key = pressed();
    var allowKey = true;

    if (key == 44 || key == 96 || key == 39) {
        allowKey = false;
    }

    return returnKeyCode(allowKey);
}

function allButQuotes() {
    var key = pressed();
    var allowKey = true;

    if (key == 34)
        allowKey = false;

    return returnKeyCode(allowKey);
}

function limitLength(input, number) {
    var tag = input.tagName.toLowerCase();
    var allowKey = true;

    switch (tag) {
        case 'textarea':
            if (input.innerText.length >= number)
                allowKey = false;

            break;
        case 'input':
            if (input.value.length >= number)
                allowKey = false;

            break;
    }

    return returnKeyCode(allowKey);
}

function returnKeyCode(bool) {
    if (bool) {
        return true;
    }
    else {
        window.event.keyCode = null;
        return false;
    }
}

function pressed() {
    return window.event.keyCode;
}

function upperCaseIt(input) {
    var tag = input.tagName.toLowerCase();

    switch (tag) {
        case 'textarea':
            input.innerText = input.innerText.toUpperCase();
            break;
        case 'input':
            input.value = input.value.toUpperCase();
            break;
    }
}

function lowerCaseIt(input) {
    var tag = input.tagName.toLowerCase();

    switch (tag) {
        case 'textarea':
            input.innerText = input.innerText.toLowerCase();
            break;
        case 'input':
            input.value = input.value.toLowerCase();
            break;
    }
}

function restrictToFloat(input, leading, trailing) {
    //first loop through all the characters and see if we've already got a decimal point
    var key = pressed();
    var allowKey = false;
    var theVal = input.value;
    var hasDecimal = false;
    var allowDecimal = true;

    var decimalIndex = theVal.indexOf(".");

    if (trailing == 0 || arguments.length == 2)
        allowDecimal = false;

    if (decimalIndex >= 0)
        hasDecimal = true;

    //a number key, comma or the decimal key was pressed and we don't have one, and we're allowing a decimal
    if (key >= 48 && key <= 57 || key == 46 || key == 44 && !hasDecimal && allowDecimal)
        allowKey = true;

    //check to see if we don't have a decimal and the key was pressed
    if (!hasDecimal) {
        //make sure we have our correct number of leading digits
        var digits = stripCharsInBag(theVal, ",");

        if (digits.length >= leading && key != 46)
            allowKey = false;


    }
    /*else
    {
    //make sure we have our correct number of leading digits
    var digitsbefore = stripCharsInBag(theVal, ",");
    var digitsafter = theVal.substr(decimalIndex+1, theVal.length);
		
		
    if(digitsbefore.length >= leading && key != 46)
    allowKey = false;
			
    //make sure the number of trailing digits don't exceed the trailing value
    if(digitsafter.length >= trailing && key != 46)
    allowKey = false;
			
    //alert(digitsbefore.length);
    //alert(digitsafter.length);
    }*/

    return returnKeyCode(allowKey);
}

function numbersOnly() {
    var key = pressed();
    var allowKey = true;

    //if enter is pressed, allow it
    if (key == 13)
        return true;

    if (key < 46 || key > 57 && allowKey) {
        allowKey = false;
    }

    return returnKeyCode(allowKey);
}

/*
11/14/2005 Brenton Unger

This next set of functions will handle masking our inputs. We validate them on submittal, but as we type, we want these to be purdy 

*******************************************************************************************************************************************
*/

function maskedControlFocus(input) {
    switch (input.getAttribute("mask").toLowerCase()) {
        case "phonenumber":
            phoneNumberFocus(input);
            break;
        case "currency":
            moneyFocus(input);
            break;
        case "date":
            dateFocus(input);
            break;
    }
}

/*
When a phone number input receives focus, we want to set our focus to the first position where a number should be entered.
If the number contains a complete value, we need to set it to the first available position to type
*/
function phoneNumberFocus(input) {
    //default cursor index to 1
    var cursorIndex = 1;

    var digitCount = stripCharsInBag(input.value, "()- ").length;

    if (digitCount == 10 || digitCount == 0)
        setCursorPosition(input, 1);
    else {
        //find our start position, only half a number has been entered
        inputArray = new Array()
        for (var x = 0; x < input.value.length; x++) {
            inputArray[x] = input.value.charAt(x);
        }

        setCursorPosition(input, findFirstSpace(inputArray));
    }
}

function phoneNumberBlur(input) {
    phoneNumber(input);
}

function phoneNumber(input) {

    //a key was pressed on our phone number input, let's mask as we go

    var key = pressed();

    if (key > 46 && key < 58 && key != 47) {
        /*
        11/14/2005 Brenton Unger
		*/

        var phoneBytes = new Array("(", " ", " ", " ", ")", " ", " ", " ", "-", " ", " ", " ", " ");
        var keyCodeBytes = new Array(48, 49, 50, 51, 52, 53, 54, 55, 56, 57);
        var numberBytes = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9);

        var numberPressed;

        //find our number that was pressed
        for (var x = 0; x < keyCodeBytes.length; x++) {
            if (keyCodeBytes[x] == key) {
                numberPressed = numberBytes[x];
                break;
            }
        }

        //now find our first available spot in the array to put it

        //NEW! Only find where to put it whenever we don't have our mask fully in place!
        if (input.value.indexOf("(") == -1 || input.value.indexOf(")") == -1 || input.value.indexOf("-") == -1 || input.value.length == 13) {
            //mask has not yet been fulfilled!
            var digits = stripCharsInBag(input.value, "()- ");

            digits = digits + numberPressed;

            for (var x = 0; x < digits.length; x++) {
                phoneBytes[findFirstSpace(phoneBytes)] = digits.charAt(x);
            }

            //clear our value out, and re-set it back to our phoneBytes only if the value
            input.value = "";

            for (var x = 0; x < phoneBytes.length; x++) {
                input.value += phoneBytes[x];
            }

            //finally, set our cursor to the next available position, and disable the button having been pressed
            setCursorPosition(input, findFirstSpace(phoneBytes));

            return returnKeyCode(false);
        }
        else {
            //allow the key
            return returnKeyCode(true);
        }
    }
    else
        return returnKeyCode(false);
}

function dateFocus(input) {
    //find the first available position in our input to make our date
    var cursorIndex = 1;

    var digitCount = stripCharsInBag(input.value, "/ ").length;

    if (digitCount == 8 || digitCount == 0)
        setCursorPosition(input, 0);
    else {
        //find our start position, only half a date has been entered
        inputArray = new Array()
        for (var x = 0; x < input.value.length; x++) {
            inputArray[x] = input.value.charAt(x);
        }

        setCursorPosition(input, findFirstSpace(inputArray));
    }
}

function date(input) {
    //key has been pressed or we're being called from the blur function...format our date
    var key = pressed();

    if (key > 46 && key < 58 && key != 47) {
        var dateBytes = new Array(" ", " ", "/", " ", " ", "/", " ", " ", " ", " ");
        var keyCodeBytes = new Array(48, 49, 50, 51, 52, 53, 54, 55, 56, 57);
        var numberBytes = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9);

        var numberPressed;

        //find our number that was pressed
        for (var x = 0; x < keyCodeBytes.length; x++) {
            if (keyCodeBytes[x] == key) {
                numberPressed = numberBytes[x];
                break;
            }
        }

        //now find our first available spot in the array to put it
        //Only find where to put it whenever we don't have our mask fully in place!
        if (input.value.indexOf("/") == -1 || !(input.value.lastIndexOf("/") > 2) || input.value.length == 10) {
            var digits = stripCharsInBag(input.value, "/");
            digits = digits + numberPressed;

            for (var x = 0; x < digits.length; x++) {
                dateBytes[findFirstSpace(dateBytes)] = digits.charAt(x);
            }

            //clear our value out, and re-set it back to our phoneBytes
            input.value = "";

            for (var x = 0; x < dateBytes.length; x++) {
                input.value += dateBytes[x];
            }

            //finally, set our cursor to the next available position, and disable the button having been pressed
            setCursorPosition(input, findFirstSpace(dateBytes));

            return returnKeyCode(false);
        }
        else {
            //allow this key to be typed where the user put it
            return returnKeyCode(true);
        }
    }
    else
        return returnKeyCode(false);
}

function dateBlur(input) {
    date(input);
}

function findFirstSpace(array) {
    var index = -1;

    for (var x = 0; x < array.length; x++) {
        if (array[x] == " ") {
            index = x;
            break;
        }
    }

    return index;
}

function makeDecimal(input, precision) {
    makeMoney(input, precision);
    input.value = input.value.replace("$", "");
}

function makePercent(input, precision) {
    input.value = input.value + "%";
}

function makeMoney(input, precision) {
    var cost = stripCharsInBag(input.value, "$,");
    var decimalIndex; //index of the decimal in the cost string
    var numbers; //string of numbers before the decimal point
    var digits; //string of numbers after the decimal
    var numberArray; //array of numbers, backwards
    var count = 0; //counter variable
    var formattedCost = ""; //final value of cost to be output

    if (!precision)
        precision = 2;

    if (cost.indexOf(".") == -1) {
        if (cost == "")
            cost = "0";

        //no decimals, add them
        cost = cost + ".";
        for (var x = 0; x < precision; x++) {
            cost = cost + "0";
        }
    }
    else {
        //we have a decimal point, make sure our precision matches our passed precision
        digits = cost.substring(cost.indexOf(".") + 1);

        if (digits.length < precision) {
            //add tenths/hundreths/etc until we have our set precision reached			
            for (var x = digits.length; x < precision; x++) {
                cost = cost + "0";
            }
        }

        if (digits.length > precision) {
            //too many decimals, cut them off at our precision
            cost = cost.substring(0, cost.indexOf(".")) + '.' + digits.substring(0, precision);
        }
    }

    //now that we have an awesome looking cost string...let's add our commas
    decimalIndex = cost.indexOf(".");
    numbers = cost.substring(0, decimalIndex);

    numberArray = new Array();

    //take all of our numbers, put them into an array backwards...as we add, check to see if it's the 3rd position 
    //and that we don't have any more numbers to add

    for (var x = numbers.length - 1; x >= 0; x--) {
        count++;
        numberArray.push(numbers.charAt(x));

        if (count == 3 && x != 0) {
            numberArray.push(",");
            count = 0;
        }
    }

    //now reverse the array and drop them into our final cost
    numberArray = numberArray.reverse();

    for (var x = 0; x < numberArray.length; x++) {
        formattedCost += numberArray[x];
    }

    input.value = "$" + formattedCost + "." + cost.substring(decimalIndex + 1);
}

function moneyFocus(input) {
    input.value = stripCharsInBag(input.value, "$");
    input.select();
}

//Use this function to move your cursor to locations within an input
function setCursorPosition(input, position) {
    var inputTextRange = input.createTextRange();
    inputTextRange.moveStart('character', position);
    inputTextRange.collapse();
    inputTextRange.select();
}

//get the cursor position w/in an input
function getCursorPosition(input) {
    var selection;
    var textRange;
    var range;
    var position;

    selection = document.selection;

    if (selection) {
        range = selection.createRange();
        textRange = input.createTextRange();
        textRange.setEndPoint("EndToStart", range);
        position = input.text.length;
    }

    return position;
}
function noSpecialCharactersExceptEnter() {
    var key = pressed();
    var allowKey = true;
    if (!((key >= 48 && key <= 57) || (key >= 65 && key <= 90) || (key >= 97 && key <= 122) || (key == 32) || (key == 13))) {
        allowKey = false;
    }

    return returnKeyCode(allowKey);
}
var styleToSelect;
function onOk() {
    location.reload(true);
}
function itemRequesting(sender, eventArgs) {
    var context = eventArgs.get_context();
    context["Filter"] = sender.get_text();
}

//Display a select item if nothing is selected
function DevExComboDefaultItem(s, e, itemText, itemValue) {
    if (s.GetSelectedIndex() == -1) {
        s.InsertItem(0, itemText, itemValue);
        s.SetSelectedIndex(0);
    }
    if (s.GetSelectedIndex() == -1) { s.SetSelectedIndex(0); }
}

//Display an all item in the combo in addition to the databound items
//  The all item is always present.
//  If there is nothing selected the all item will be.
function DevExComboUnboundItem(s, e, itemText, itemValue) {
    if (s.GetSelectedIndex() == -1) {
        s.InsertItem(0, itemText, itemValue);
    }
    else if (s.GetItem(0).value != itemValue) {
        s.InsertItem(0, itemText, itemValue);
    }
    if (s.GetSelectedIndex() == -1) { s.SetSelectedIndex(0); }
}

function stripCharsInBag(s, bag) {
    var i;
    var returnString = "";
    // Search through string's characters one by one.
    // If character is not in bag, append to returnString.
    for (i = 0; i < s.length; i++) {
        var c = s.charAt(i);
        if (bag.indexOf(c) == -1) returnString += c;
    }
    return returnString;
}

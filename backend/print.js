let consoleIndex=-1
let colorSwitch="\x1b[37m"

function getFormattedDate() {
    const date = new Date();

    // Get day, month, and year
    const day = String(date.getDate()).padStart(2, '0'); // Ensure two digits
    const month = String(date.getMonth() + 1).padStart(2, '0'); // Months are 0-based
    const year = String(date.getFullYear()).slice(-2); // Get last two digits of year

    // Get hours and minutes
    let hours = date.getHours();
    const minutes = String(date.getMinutes()).padStart(2, '0'); // Ensure two digits
    const ampm = hours >= 12 ? 'PM' : 'AM';

    // Convert to 12-hour format
    hours = hours % 12;
    hours = hours ? hours : 12; // '0' should be '12'

    // Format hours as two digits
    const formattedHours = String(hours).padStart(2, '0');

    // Combine everything into the desired format
    return `\x1b[34m${day}/${month}/${year}\x1b[37m ;\x1b[34m ${formattedHours}:${minutes} ${ampm}\x1b[37m`;
}

function printLog(prefix,color,status,message){
    switch(color){
        case "r":
            colorSwitch="\x1b[31m"
            break
        case "g":
            colorSwitch="\x1b[32m"
            break
        case "y":
            colorSwitch="\x1b[33m"
            break
        case "b":
            colorSwitch="\x1b[34m"
            break
        case "m":
            colorSwitch="\x1b[35m"
            break
        case "c":
            colorSwitch="\x1b[36m"
            break
        case "w":
            colorSwitch="\x1b[37m"
            break
        default:
    }
    consoleIndex++;
    return `\n\n${consoleIndex}) [${getFormattedDate()}] (${colorSwitch}${prefix}\x1b[37m) status : ${colorSwitch}${status}\x1b[37m \n\t\x1b[37m${message}`
}

function printValue(property, value) {
    return `\n\t\t\x1b[36m${property} : \x1b[32m${value}\x1b[37m`
}

module.exports = {
    printLog,
    printValue,
};

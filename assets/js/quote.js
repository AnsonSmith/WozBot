export var Quote = {
    run: function() {
        // put initializer stuff here
        // for example:
        console.log("Quote Initializer!!");
        var randomQuoteBtn = document.getElementById("random-quote-btn");
        console.log(randomQuoteBtn);
        randomQuoteBtn.addEventListener('click', getRandomQuote);
    }

};

function getRandomQuote() {
    console.log("Clickity Clickity Click");
    var request = new XMLHttpRequest();
    request.open('GET', '/api/quotes/random', true);

    request.onload = function() {
        if (request.status >= 200 && request.status < 400) {
            // Success!
            console.log("Success!");
            var rsp = JSON.parse(request.responseText);
            console.log(rsp);
            updateQuote(rsp.data);
        } else {
            // We reached our target server, but it returned an error
            console.log("Error: " + request.status);
        }
    };

    request.onerror = function() {
        // There was a connection error of some sort
        console.log("Connection Error");
    };

    request.send();
}

function updateQuote(data) {
    var quoteLine = document.getElementById("quote-line");
    var quoteAuthor = document.getElementById("quote-author");

    quoteLine.innerHTML= data.quotation;
    quoteAuthor.innerHTML = data.author;
}

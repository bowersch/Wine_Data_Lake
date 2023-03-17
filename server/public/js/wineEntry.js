function toggleFavorite(x, itemType, itemId) {
    var cl = x.querySelector('.fa-heart').classList
    if(cl.contains('fa-regular')) {
        cl.replace('fa-regular', 'fa-solid');
        fetch("/addFavorite", {
            method : "POST",
            headers : {'Content-Type': 'application/json'}, 
            body : JSON.stringify({
                itemType : itemType,
                itemId : itemId
            })
        });
    } else {
        cl.replace('fa-solid', 'fa-regular');
        fetch("/removeFavorite", {
            method : "POST",
            headers : {'Content-Type': 'application/json'}, 
            body : JSON.stringify({
                itemType : itemType,
                itemId : itemId
            })
        });
    }
}
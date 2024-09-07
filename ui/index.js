window.addEventListener("message", function (event) {
    let data = event.data
    switch (data.action) {
        case "openPanel":
            openPanel(data.arr)
            break
    }
})

function openPanel(list) {
    list.array.forEach(selector => {
        // Create html button with info
        // Should contain: racename, owner, number of waypoints
    });
}
const nyo_elevator = new Module("nyo_elevator");

function elevadorMove(i) {
	FetchData("elevadorMove", { i });
}

nyo_elevator.registerOpenUiFunction(({ locs, elevadorName: eName }) => {
	$("mainElevador menu section").html("");

	if (eName) {
		$(".elevadorName").html(eName);
	} else {
		$(".elevadorName").html("ELEVADOR");
	}
	for (i = 0; i < locs.length; i++) {
		var newI = i + 1;

		if (locs[i].name != undefined) {
			andarName = locs[i].name;
		} else {
			andarName = `Andar ${newI}`;
		}

		$("mainElevador menu section").append(`
        <div class="item" onCLick="elevadorMove(${newI})">
                    <span>${andarName}</span>
        </div>`);
	}
});


nyo_elevator.registerCloseUiFunction(() => {
    FetchData('close')
})
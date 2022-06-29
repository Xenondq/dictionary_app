/*
 Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.red,
          child: Stack(
            children: [
              Positioned(
                  top: MediaQuery.of(context).size.height * 0.08,
                  left: MediaQuery.of(context).size.width * 0.38,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(baykus,
                        width: MediaQuery.of(context).size.width * 0.25),
                  )),
              Positioned(
                  top: MediaQuery.of(context).size.height * 0.32,
                  left: MediaQuery.of(context).size.width * 0.45,
                  child: const Icon(
                    Icons.translate,
                    color: Colors.white,
                    size: 50,
                  )),
              Positioned(
                  top: MediaQuery.of(context).size.height * 0.55,
                  left: MediaQuery.of(context).size.width * 0.25,
                  child: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.volume_up))),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.45,
                left: MediaQuery.of(context).size.width * 0.25,
                child: Container(
                  width: 220,
                  height: 70,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: TranslateBoxRadius.all()),
                  child: TextFormField(),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.42,
                left: MediaQuery.of(context).size.width * 0.40,
                child: Container(
                  width: 100,
                  height: 30,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: TranslateBoxRadius.all()),
                  child: Align(child: const Text("Türkçe")),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.65,
                left: MediaQuery.of(context).size.width * 0.25,
                child: Container(
                  width: 220,
                  height: 70,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: TranslateBoxRadius.all()),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.74,
                left: MediaQuery.of(context).size.width * 0.40,
                child: Container(
                  width: 100,
                  height: 30,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: TranslateBoxRadius.all()),
                  child: Align(child: const Text("İngilizce")),
                ),
              ),
            ],
          ),
        ),*/
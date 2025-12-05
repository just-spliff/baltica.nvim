local M = {}

M.colors = {
	-- TŁO: "Baltic Petrol" (#031E26                           )
	-- Gęsta, ciemna woda. Połączenie głębokiej zieleni i granatu.
	void_main = "#031E26",
	void_darker = "#01141a", -- Gutter/Panel boczny
	void_float = "#06262e", -- Pływające okna (nieco jaśniejsze)

	-- UI: Elementy techniczne
	sonar_grey = "#456a70", -- Numery linii, komentarze (szaro-morskie)
	glass_frame = "#1c4e5e", -- Ramki, podziały okien

	-- TEKST: "Ghost Light"
	-- Złamana biel wpadająca w błękit.
	ghost_white = "#d1e8ee",
	ghost_dim = "#567a80", -- Przygaszone elementy

	-- THE TRIAD (Główne kolory składni)

	-- 1. BURSZTYN (Data/Value)
	-- Ciepły, mocny pomarańcz. Kontrastuje z zimnym tłem (Teal & Orange).
	amber_core = "#ffae00", -- Stringi
	amber_glow = "#ffcc00", -- Jasny akcent
	amber_glass = "#e09100", -- Liczby

	-- 2. BIOLUMINESCENCJA (Action/Life)
	-- Neonowa zieleń i cyjan. To, co "działa".
	bio_venom = "#00ff9d", -- Funkcje
	bio_electric = "#00f0ff", -- Typy, Klasy

	-- 3. LÓD (Structure/Flow)
	-- Słowa kluczowe. Chłodne, by nie rozpraszały.
	ice_blue = "#6dc7d1", -- if, else, return

	-- ALERTY I STATUSY
	rust_blood = "#ff5544", -- Error / Delete
	warning_beam = "#e6b450", -- Warning / Change
	selection_glaze = "#0f4552", -- Visual Selection

	none = "NONE",
}

return M

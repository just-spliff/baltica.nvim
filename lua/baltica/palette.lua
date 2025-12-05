local M = {}

M.colors = {
	-- TŁO: "Baltic Petrol"
	-- To jest ten kolor: ciemny, nasycony zielononiebieski (Teal).
	-- Już nie "czarna dziura", ale "gęsta woda".
	void_main = "#031E26",
	void_darker = "#01141a", -- Panel boczny (Gutter) - ciemniejszy cień
	void_float = "#082d38", -- Pływające okna - jaśniejsza tafla wody

	-- UI: Elementy interfejsu
	sonar_grey = "#456a70", -- Numery linii (bardziej morskie)
	glass_frame = "#1c4e5e", -- Ramki

	-- TEKST: "Ghost Light"
	-- Blady cyjan, idealnie pasuje do turkusowego tła.
	ghost_white = "#d1e8ee",
	ghost_dim = "#567a80", -- Komentarze (wtopione w tło)

	-- THE TRIAD (Trójca Kolorystyczna)

	-- 1. BURSZTYN (The Prize)
	-- Na tym nowym tle ten kolor będzie dosłownie WYSKAKIWAŁ z ekranu.
	-- Kontrast Teal (Tło) vs Orange (Bursztyn) to klasyka kina.
	amber_core = "#ffae00",
	amber_glow = "#ffcc00",
	amber_glass = "#e09100",

	-- 2. BIOLUMINESCENCJA (Life)
	-- Neonowa zieleń
	bio_venom = "#00ff9d",
	bio_electric = "#00f0ff", -- Typy

	-- 3. LÓD (Structure)
	-- Słowa kluczowe (if/else) w kolorze lodowatego błękitu.
	ice_blue = "#6dc7d1", -- Nieco jaśniejszy, żeby nie zginął na nowym tle

	-- SPECJALNE
	rust_blood = "#ff5544",
	warning_beam = "#e6b450",

	-- Selection (Ważne!)
	selection_glaze = "#0f4552", -- Wyraźniejsze zaznaczenie w kolorze morskiej głębi

	none = "NONE",
}

return M

local M = {}

M.colors = {
	-- TŁO: Absolute Deep Teal. To nie jest czerń. To gęsta, ciemna woda.
	-- Daje efekt "zanurzenia" (Immersive).
	abyss = "#021216",
	abyss_layer = "#061e24", -- status lines
	abyss_highlight = "#0e2d36", -- selection

	-- TEKST: Piana morska. Zimna, lekko niebieskawa biel.
	foam_white = "#dcebf5",

	-- KOMENTARZE: Ciemny turkus. Zlewają się z tłem. Są jak woda w tle.
	sea_shadow = "#3b5e66",

	-- THE TRINITY (Trójca Kolorystyczna)

	-- 1. FOSFORESCENCJA (Action/Life) - Neonowa mięta/zieleń
	-- Dla: Funkcji, Metod.
	plankton_green = "#00ff9d",

	-- 2. PRĄDY MORSKIE (Flow/Logic) - Elektryczny Turkus/Cyjan
	-- Dla: Słów kluczowych (if/else), Operatorów, Typów.
	electric_cyan = "#00f0ff",
	deep_current = "#0099cc", -- ciemniejszy cyjan dla mniej ważnych

	-- 3. BURSZTYN (Data/Treasure) - Głęboki, płonący pomarańcz/złoto
	-- Dla: Stringów, Liczb, Stałych.
	burning_amber = "#ffae00",
	ancient_gold = "#e09100",

	-- ALERTY (Inne niż standardowe)
	jellyfish_sting = "#bd5eff", -- Błędy/Specjalne (Parzący fiolet)
	rust_warning = "#ff6b4a", -- Ostrzeżenia (Rdzawy pław)

	none = "NONE",
}

return M

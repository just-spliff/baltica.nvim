local M = {}

M.colors = {
	-- BACKGROUND: "Deepest Baltic"
	-- Bardzo ciemny, zmatowiony turkus. To nie jest czerń. To kolor głębiny.
	bg_main = "#01161B",
	bg_float = "#031E24", -- Pływające okna (nieco jaśniejsze)
	bg_gutter = "#01161B",
	bg_visual = "#10333B", -- Eleganckie zaznaczenie

	-- UI: "Submerged Metal"
	-- Kolory interfejsu są ciemne, by nie odciągać uwagi od kodu.
	ui_border = "#1D454E",
	ui_line_nr = "#365961",
	ui_cursor = "#2EEAEB", -- Kursor świeci jak sonar

	-- FOREGROUND: "Sea Foam"
	-- Złamana biel, lekko zimna.
	fg_main = "#C5DDE6",
	fg_dim = "#5F8791", -- Komentarze (idealnie wtopione)

	-- THE PALETTE (Starannie dobrana saturacja)

	-- AMBER (The Soul) - Dane
	-- Używamy gradientu: od głębokiego miodu do jasnego złota.
	amber_dark = "#D48F00", -- Liczby, Boolean (Ciężki bursztyn)
	amber_bright = "#FFB62E", -- Stringi (Świecący bursztyn)

	-- PHOSPHOR (The Life) - Logika
	-- Toksyczna, ale czytelna zieleń/cyjan.
	cyan_neon = "#2EEAEB", -- Typy, Konstruktory
	green_bio = "#41EB96", -- Funkcje, Metody (Musi być wyraźne)

	-- ABYSSAL BLUE (The Structure)
	-- To jest klucz do "Premium". Słowa kluczowe nie są jaskrawe.
	-- Są w kolorze wody, by tworzyć tło dla danych.
	blue_haze = "#569CA8", -- Keywords (if, else, return)
	blue_deep = "#2A6E7D", -- Operatory, Interpunkcja

	-- ALERTS
	error = "#FF5D62", -- Koral (Soft Red)
	warning = "#E6B450",
	info = "#2EEAEB",

	none = "NONE",
}

return M

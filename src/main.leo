program snake.aleo {
	struct Word {
		ch1: u8,
		ch2: u8,
		ch3: u8,
		ch4: u8,
		ch5: u8,
	}

	struct Guessed {
		ch1: bool,
		ch2: bool,
		ch3: bool,
		ch4: bool,
		ch5: bool,
	}

	record ActiveGame {
		owner: address,
		player: address,
		remaining_trials: u8,
		word: Word,
		guessed: Guessed,
		won: bool,
		lost: bool,
	}
		

	transition create_game(public player: address, word: Word) -> ActiveGame {
		let guessed: Guessed = Guessed {
			ch1: false,
			ch2: false,
			ch3: false,
			ch4: false,
			ch5: false,
		};
		let active_game: ActiveGame = ActiveGame {
			owner: self.caller,
			player: player,
			remaining_trials: 4u8,
			word: word,
			guessed: guessed,
			won: false,
			lost: false,
		};
		return active_game;
	}

	transition make_guess(active_game: ActiveGame, character: u8) -> ActiveGame {
		assert(active_game.owner == self.caller);
		assert(active_game.remaining_trials > 0u8);
		assert(active_game.lost == false);

		let c1: u8 = active_game.word.ch1;
		let c2: u8 = active_game.word.ch2;
		let c3: u8 = active_game.word.ch3;
		let c4: u8 = active_game.word.ch4;
		let c5: u8 = active_game.word.ch5;

		let g1: bool = active_game.guessed.ch1;
		let g2: bool = active_game.guessed.ch2;
		let g3: bool = active_game.guessed.ch3;
		let g4: bool = active_game.guessed.ch4;
		let g5: bool = active_game.guessed.ch5;

		let ch: u8 = character;
		if (ch == c1) {
			g1 = true;
		}
		if (ch == c2) {
			g2 = true;
		}
		if (ch == c3) {
			g3 = true;
		}
		if (ch == c4) {
			g4 = true;
		}
		if (ch == c5) {
			g5 = true;
		}

		let remaining_trials: u8 = active_game.remaining_trials;
		let lost: bool = false;
		let won: bool = false;
		if (ch != c1 && ch != c2 && ch != c3 && ch != c4 && ch != c5) {
			remaining_trials -= 1u8;
			if (remaining_trials == 0u8) {
				lost = true;
			}
		}

		if (g1 && g2 && g3 && g4 && g5) {
			won = true;
		}
		let guessed: Guessed = Guessed {
			ch1: g1,
			ch2: g2,
			ch3: g3,
			ch4: g4,
			ch5: g5,
		};

		let updated_active_game: ActiveGame = ActiveGame {
			owner: self.caller,
			player: active_game.player,
			remaining_trials: remaining_trials,
			word: active_game.word,
			guessed: guessed,
			won: won,
			lost: lost,
		};

		return updated_active_game;
	}
}

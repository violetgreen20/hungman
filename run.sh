#!/bin/bash

if ! command -v leo &> /dev/null
then
	echo "leo is not installed."
	exit
fi

leo run create_game aleo132ngrtqmlysat7d65nfjr3k56x6ww87gyyhavehplncyt9ytf58qatyxgn "{ ch1: 0u8, ch2: 1u8, ch3: 2u8, ch4: 3u8, ch5: 4u8 }"

leo run make_guess "{
  owner: aleo10cz8yt9kwyqqvmwdt0hswdplvsc60eey8msxyh3yj8wqq5k5jq9suc7kw4.private,
  player: aleo132ngrtqmlysat7d65nfjr3k56x6ww87gyyhavehplncyt9ytf58qatyxgn.private,
  remaining_trials: 4u8.private,
  word: {
    ch1: 0u8.private,
    ch2: 1u8.private,
    ch3: 2u8.private,
    ch4: 3u8.private,
    ch5: 4u8.private
  },
  guessed: {
    ch1: false.private,
    ch2: false.private,
    ch3: false.private,
    ch4: false.private,
    ch5: false.private
  },
  won: false.private,
  lost: false.private,
  _nonce: 7682695600942256019076835057941154665170229300882576143371494791587008103234group.public
}" 2u8

echo "Should have guessed: {
	ch1: false,
	ch2: false,
	ch3: true,
	ch4: false,
	ch5: false,
}"

leo run make_guess "{
  owner: aleo10cz8yt9kwyqqvmwdt0hswdplvsc60eey8msxyh3yj8wqq5k5jq9suc7kw4.private,
  player: aleo132ngrtqmlysat7d65nfjr3k56x6ww87gyyhavehplncyt9ytf58qatyxgn.private,
  remaining_trials: 4u8.private,
  word: {
    ch1: 0u8.private,
    ch2: 1u8.private,
    ch3: 2u8.private,
    ch4: 3u8.private,
    ch5: 4u8.private
  },
  guessed: {
    ch1: false.private,
    ch2: false.private,
    ch3: true.private,
    ch4: false.private,
    ch5: false.private
  },
  won: false.private,
  lost: false.private,
  _nonce: 7682695600942256019076835057941154665170229300882576143371494791587008103234group.public
}" 1u8

echo "Should have guessed: {
	ch1: false,
	ch2: true,
	ch3: true,
	ch4: false,
	ch5: false,
}"

leo run make_guess "{
  owner: aleo10cz8yt9kwyqqvmwdt0hswdplvsc60eey8msxyh3yj8wqq5k5jq9suc7kw4.private,
  player: aleo132ngrtqmlysat7d65nfjr3k56x6ww87gyyhavehplncyt9ytf58qatyxgn.private,
  remaining_trials: 4u8.private,
  word: {
    ch1: 0u8.private,
    ch2: 1u8.private,
    ch3: 2u8.private,
    ch4: 3u8.private,
    ch5: 4u8.private
  },
  guessed: {
    ch1: false.private,
    ch2: true.private,
    ch3: true.private,
    ch4: false.private,
    ch5: false.private
  },
  won: false.private,
  lost: false.private,
  _nonce: 7682695600942256019076835057941154665170229300882576143371494791587008103234group.public
}" 0u8

echo "Should have guessed: {
	ch1: true,
	ch2: true,
	ch3: true,
	ch4: false,
	ch5: false,
}"

leo run make_guess "{
  owner: aleo10cz8yt9kwyqqvmwdt0hswdplvsc60eey8msxyh3yj8wqq5k5jq9suc7kw4.private,
  player: aleo132ngrtqmlysat7d65nfjr3k56x6ww87gyyhavehplncyt9ytf58qatyxgn.private,
  remaining_trials: 4u8.private,
  word: {
    ch1: 0u8.private,
    ch2: 1u8.private,
    ch3: 2u8.private,
    ch4: 3u8.private,
    ch5: 4u8.private
  },
  guessed: {
    ch1: true.private,
    ch2: true.private,
    ch3: true.private,
    ch4: false.private,
    ch5: false.private
  },
  won: false.private,
  lost: false.private,
  _nonce: 7682695600942256019076835057941154665170229300882576143371494791587008103234group.public
}" 5u8

echo "Should have guessed: {
	ch1: true,
	ch2: true,
	ch3: true,
	ch4: false,
	ch5: false,
}"

leo run make_guess "{
  owner: aleo10cz8yt9kwyqqvmwdt0hswdplvsc60eey8msxyh3yj8wqq5k5jq9suc7kw4.private,
  player: aleo132ngrtqmlysat7d65nfjr3k56x6ww87gyyhavehplncyt9ytf58qatyxgn.private,
  remaining_trials: 3u8.private,
  word: {
    ch1: 0u8.private,
    ch2: 1u8.private,
    ch3: 2u8.private,
    ch4: 3u8.private,
    ch5: 4u8.private
  },
  guessed: {
    ch1: true.private,
    ch2: true.private,
    ch3: true.private,
    ch4: false.private,
    ch5: false.private
  },
  won: false.private,
  lost: false.private,
  _nonce: 7682695600942256019076835057941154665170229300882576143371494791587008103234group.public
}" 6u8

echo "Should have guessed: {
	ch1: true,
	ch2: true,
	ch3: true,
	ch4: false,
	ch5: false,
}"

leo run make_guess "{
  owner: aleo10cz8yt9kwyqqvmwdt0hswdplvsc60eey8msxyh3yj8wqq5k5jq9suc7kw4.private,
  player: aleo132ngrtqmlysat7d65nfjr3k56x6ww87gyyhavehplncyt9ytf58qatyxgn.private,
  remaining_trials: 2u8.private,
  word: {
    ch1: 0u8.private,
    ch2: 1u8.private,
    ch3: 2u8.private,
    ch4: 3u8.private,
    ch5: 4u8.private
  },
  guessed: {
    ch1: true.private,
    ch2: true.private,
    ch3: true.private,
    ch4: false.private,
    ch5: false.private
  },
  won: false.private,
  lost: false.private,
  _nonce: 7682695600942256019076835057941154665170229300882576143371494791587008103234group.public
}" 7u8

echo "Should have guessed: {
	ch1: true,
	ch2: true,
	ch3: true,
	ch4: false,
	ch5: false,
}"

leo run make_guess "{
  owner: aleo10cz8yt9kwyqqvmwdt0hswdplvsc60eey8msxyh3yj8wqq5k5jq9suc7kw4.private,
  player: aleo132ngrtqmlysat7d65nfjr3k56x6ww87gyyhavehplncyt9ytf58qatyxgn.private,
  remaining_trials: 1u8.private,
  word: {
    ch1: 0u8.private,
    ch2: 1u8.private,
    ch3: 2u8.private,
    ch4: 3u8.private,
    ch5: 4u8.private
  },
  guessed: {
    ch1: true.private,
    ch2: true.private,
    ch3: true.private,
    ch4: false.private,
    ch5: false.private
  },
  won: false.private,
  lost: false.private,
  _nonce: 7682695600942256019076835057941154665170229300882576143371494791587008103234group.public
}" 4u8

echo "Should have guessed: {
	ch1: true,
	ch2: true,
	ch3: true,
	ch4: false,
	ch5: true,
}"

leo run make_guess "{
  owner: aleo10cz8yt9kwyqqvmwdt0hswdplvsc60eey8msxyh3yj8wqq5k5jq9suc7kw4.private,
  player: aleo132ngrtqmlysat7d65nfjr3k56x6ww87gyyhavehplncyt9ytf58qatyxgn.private,
  remaining_trials: 1u8.private,
  word: {
    ch1: 0u8.private,
    ch2: 1u8.private,
    ch3: 2u8.private,
    ch4: 3u8.private,
    ch5: 4u8.private
  },
  guessed: {
    ch1: true.private,
    ch2: true.private,
    ch3: true.private,
    ch4: false.private,
    ch5: true.private
  },
  won: false.private,
  lost: false.private,
  _nonce: 7682695600942256019076835057941154665170229300882576143371494791587008103234group.public
}" 3u8

echo "Should have guessed: {
	ch1: true,
	ch2: true,
	ch3: true,
	ch4: true,
	ch5: true,
}"

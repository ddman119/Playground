{-# LANGUAGE RankNTypes #-}

import Data.Functor.Identity

type ImprovedLens s a = Functor f => (a -> f a) -> s -> f s

over :: ImprovedLens s a -> (a -> a) -> s -> s
over ln f s = _ (ln Identity)

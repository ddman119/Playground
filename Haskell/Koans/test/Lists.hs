module Lists where

import Test.Hspec (Spec, describe, it)
import Test.HUnit (assertBool, assertEqual)
import Util

koans :: Koan
koans = describe "Lists" $ do
    koanDrop
    koanTake
    koanHead
    koanTail
    koanInit
    koanLast
    koanConcat
    koanReplicate
    koanRepeat
    koanIterate

koanDrop :: Koan
koanDrop = koan "drop function" $ do
    let result = drop 3 [1..10]
    assertEqual "use drop function" [4,5,6,7,8,9,10] result

koanTake :: Koan
koanTake = koan "take function" $ do
    let result = take 3 [1..10]
    assertEqual "use take function" [1,2,3] result

koanHead :: Koan
koanHead = koan "head function" $ do
    let result = head [1..10]
    assertEqual "use head function" 1 result

koanTail :: Koan
koanTail = koan "tail function" $ do
    let result = tail [1..10]
    assertEqual "use tail function" [2,3,4,5,6,7,8,9,10] result


koanInit :: Koan
koanInit = koan "init function" $ do
    let result = init [1..10]
    assertEqual "use init function" [1,2,3,4,5,6,7,8,9] result

koanLast :: Koan
koanLast = koan "last function" $ do
    let result = last [1..10]
    assertEqual "use last function" 10 result

koanConcat :: Koan
koanConcat = koan "concat function" $ do
    let result = concat [[5, 6], [1..10]]
    assertEqual "use concat function" [5,6,1,2,3,4,5,6,7,8,9,10] result

koanReplicate :: Koan
koanReplicate = koan "replicate function" $ do
    let result = replicate 4 4 
    assertEqual "use replicate function" [4,4,4,4] result

koanRepeat :: Koan
koanRepeat = koan "repeat function" $ do
    let result = repeat 1
    assertEqual "use repeat function" [1,1,1] (take 3 result)

koanIterate :: Koan
koanIterate = koan "iterate function" $ do
    let result = iterate (+1) 1
    assertEqual "use iterate function" [1,2,3,4,5] (take 5 result)


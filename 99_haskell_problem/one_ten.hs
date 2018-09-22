-- 最后的元素
mylast :: [a]->a
mylast [x]=x
mylast (_:xs)=mylast xs 

-- 倒数第二个元素
myButLast :: [a]->a
myButLast [x,_]=x
myButLast (x:xs)=myButLast xs

-- 第n个元素
elementAt :: [a] -> Int -> a
elementAt (x:_) 1 =  x
elementAt (x:xs) n = elementAt xs (n-1)

--  长度
myLength :: [a] -> Int
myLength [] = 0
myLength x= foldr (\_ acc -> acc + 1) 0 x 
-- myLength x= foldl (\acc _ -> acc + 1) 0 x 

-- 反向输出数组
myReverse :: [a] -> [a]
myReverse []=[]
myReverse (x:xs) = myReverse xs ++ [x]

-- 判断数组是否镜像
isPalindrome :: Eq a => [a] -> Bool
isPalindrome x = x == reverse x

-- 展平一个数组
-- data NestList a = Elem a | List[NestList a]
-- myFlatten 

-- myCompress :: [a] -> [a]
-- myCompress 


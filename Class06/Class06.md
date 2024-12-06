# Class06: Functions
Juan Manuel (PID: A69034758)

The first function we write

``` r
add <- function(x,y){
  x +y
}
```

Can we use it?

``` r
add(1,1)
```

    [1] 2

``` r
add(x=1,y=100)
```

    [1] 101

``` r
add(c(100,1,100),1)
```

    [1] 101   2 101

If you wanna define a default value, such as y=1, then we can omit the y
value on the function.

``` r
add2 <- function(x,y=1){
  x +y
}
```

``` r
add2(10)
```

    [1] 11

\#A second function Q1. Make a function “generate_DNA()” that makes a
random nucleotides seq of any lenght

``` r
bases <- c("A","C","G","T")

sample(bases, size = 50, replace=TRUE)
```

     [1] "C" "T" "C" "G" "C" "A" "T" "G" "G" "T" "G" "A" "A" "C" "A" "C" "T" "G" "T"
    [20] "A" "T" "T" "G" "C" "G" "G" "T" "A" "T" "G" "G" "T" "T" "A" "A" "C" "G" "C"
    [39] "G" "G" "C" "C" "A" "G" "C" "A" "T" "C" "A" "C"

The last one is out wee working snipet. Now let’s try make it into a
function.

``` r
generate_DNA <- function(length){
  bases <- c("A","C","G","T")
  sequence <- sample(bases, size = length, 
         replace=TRUE)
  return(sequence)
  }
```

``` r
generate_DNA(10)
```

     [1] "A" "T" "A" "G" "A" "A" "G" "C" "A" "C"

After installing the package bio3d, we can access the table of aa

``` r
bio3d::aa.table$aa1
```

     [1] "A" "R" "N" "D" "C" "Q" "E" "G" "H" "I" "L" "K" "M" "F" "P" "S" "T" "W" "Y"
    [20] "V" "X" "D" "R" "C" "C" "C" "C" "C" "C" "C" "C" "H" "E" "H" "H" "H" "H" "H"
    [39] "H" "D" "K" "K" "M" "K" "M" "C" "F" "Y" "S" "T"

To make it unique:

``` r
aa <- unique(bio3d::aa.table$aa1)[1:20]
aa
```

     [1] "A" "R" "N" "D" "C" "Q" "E" "G" "H" "I" "L" "K" "M" "F" "P" "S" "T" "W" "Y"
    [20] "V"

Then we can write a function that generates proteins

``` r
generate_protein <- function(length){
  aa
  aachain <- sample(aa, size = length, 
         replace=TRUE)
  aachain <- paste(aachain, collapse="") #we added the paste function in order to eliminate the spaces and "". 
  return(aachain)
  }
```

``` r
generate_protein(10)
```

    [1] "GMWARQLATY"

Q. Generate random protein sequences of length 6 to 13.

``` r
generate_protein(6)
```

    [1] "KDAWRR"

``` r
generate_protein(7)
```

    [1] "PRMTDYF"

``` r
generate_protein(8)
```

    [1] "AHFGHYDS"

``` r
generate_protein(9)
```

    [1] "WMWDYENCL"

``` r
generate_protein(10)
```

    [1] "CMWPLFNTMR"

``` r
generate_protein(11)
```

    [1] "FHNYHYINFGH"

``` r
generate_protein(12)
```

    [1] "NTLRMEWPMTLI"

``` r
generate_protein(13)
```

    [1] "GQMTHMQKTWFNH"

Then to write it shorter

``` r
for (x in 6:13)
print(generate_protein(x))
```

    [1] "TTKATG"
    [1] "IRPRDQP"
    [1] "HYRGLPSP"
    [1] "DPRLMVNCG"
    [1] "TQMSALGKNQ"
    [1] "HMQLGDDQSQP"
    [1] "HLDNEAEDGAYY"
    [1] "LPMGGDLKYNMAS"

In class strategy:

``` r
X <- c(6:13)
answer <- sapply(X, generate_protein)
```

To get the fasta format, we can just add the headed to each sequence
that we generated.

``` r
cat( paste(">id.",6:13, "\n", answer, sep=""), sep="\n")
```

    >id.6
    PITCEV
    >id.7
    KHWACFV
    >id.8
    GFKINKPH
    >id.9
    AQGWDIHYN
    >id.10
    QYSWFNDGRC
    >id.11
    VQKTMTGFIKK
    >id.12
    GHQEVHYFDMIY
    >id.13
    DYSPLSYNLNVFS

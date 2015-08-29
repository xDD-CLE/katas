namespace StringCalculator
    
    module Adder = 
        open Parser
        open System

        let private negativeNumberExceptionMessage = fun(negativeAddends:int list) ->
            System.String.Join(",", negativeAddends)
            |> sprintf "Negatives not allowed (%s)" 

        let private checkForNegativeNumbers = fun(addends:int list) ->
            let negativeAddend = fun(addend) -> addend < 0 
            if (List.exists negativeAddend addends) 
                then invalidArg "Negative" (negativeNumberExceptionMessage (List.filter negativeAddend addends))
            addends

        let private onlyNumbersUnderOneThousand = fun(addend:int) -> addend < 1000 

        let Add = 
            fun (addends:string) -> 
                match addends with
                | "" -> 0
                | _ -> Parse(addends)
                       |> checkForNegativeNumbers
                       |> List.filter onlyNumbersUnderOneThousand
                       |> Seq.sum


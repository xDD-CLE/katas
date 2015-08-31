namespace StringCalculator
    module Parser =

        let DEFAULT_DELIMITER = ','
        let NEWLINE_CHARACTER = '\n'

        let private replaceDelimiterOverride = fun(addends:string) -> 
            let delimiterOverride = addends.Substring(2,1)
            addends
                .Substring(4)
                .Replace((char) delimiterOverride, DEFAULT_DELIMITER)

        let private delimiterOverridden = fun(addends:string) ->
             let delimiterOverrideKey = "//"
             addends.StartsWith(delimiterOverrideKey)
    
        let private handleNewDelimiter = fun(addends:string) ->
            match delimiterOverridden(addends) with
                | true -> replaceDelimiterOverride(addends)
                | false -> addends

        let Parse = fun (addends:string) ->
            handleNewDelimiter(addends)
                .Replace(NEWLINE_CHARACTER, DEFAULT_DELIMITER)
                .Split(DEFAULT_DELIMITER)
           |> Array.toList
           |> List.map int
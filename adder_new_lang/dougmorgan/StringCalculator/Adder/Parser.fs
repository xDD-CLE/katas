namespace StringCalculator
    module Parser =

        let DEFAULT_DELIMITER = ","
        let NEWLINE_CHARACTER = "\n"

        let private replaceDelimiterWithDefault = fun (delimiter:string)(addends:string) ->
            addends.Replace(delimiter, DEFAULT_DELIMITER)

        let private getDelimiterOverride = fun(addends:string) ->
            addends.Substring(2,1)
            
        let private replaceDelimiterOverride = fun(addends:string) -> 
             addends.Substring(4)
            |> replaceDelimiterWithDefault (getDelimiterOverride addends)

        let private delimiterOverridden = fun(addends:string) ->
             let delimiterOverrideKey = "//"
             addends.StartsWith(delimiterOverrideKey)
    
        let private SplitOnDefault = fun(addends:string) -> 
            addends.Split((char)DEFAULT_DELIMITER)
            |> Array.toList
         
        let private NormalizeDelimiter = fun(addends:string) ->
            match delimiterOverridden(addends) with
                | true -> replaceDelimiterOverride(addends)
                | false -> replaceDelimiterWithDefault NEWLINE_CHARACTER addends

        let Parse = fun (addends:string) ->
           addends
           |> NormalizeDelimiter
           |> SplitOnDefault
           |> List.map int
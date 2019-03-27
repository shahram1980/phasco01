using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.CodeDom.Compiler;
using System.Reflection;
using Microsoft.CSharp;

namespace BusinessAccessLayer
{
    public class QCOperations
    {
        public static string LevelProc(string FQC, int level)
        {
            string[] StandardConcentration = new string[7];
            StandardConcentration[0] = "0.025";
            StandardConcentration[1] = "0.15";//B
            StandardConcentration[2] = "0.4";//C
            StandardConcentration[3] = "0.8";//D
            StandardConcentration[4] = "1.1";//E
            StandardConcentration[5] = "1.8";//F
            StandardConcentration[6] = "2.5";//G

            // [low , high]
            double[,] HighLow = new double[7, 2] 
            {
                { 0.001,0.1 } ,
                { 3.5, 4 } ,
                { 2.8, 3.5 } ,
                { 1.55, 3 } ,
                { 1.6, 3} ,
                { 1.5,3} ,
                { 1.35, 3} ,
            };


            double range = SplitterFormul(FQC.Replace(" ", ""), StandardConcentration);

            string res_ = "";
            double Hi = HighLow[level, 1];
            double lo = HighLow[level, 0];
            if (range > lo && range < Hi)
            {
                res_ = "2";
            }
            else
            {
                if (range > lo)
                    res_ = "1";
                if (range < Hi)
                    res_ = "3";
            }
            return res_;
        }


        public static bool Is_NumericORTenths(string s)
        {

            if (s == ".") return true;
            int num1;
            if (int.TryParse(s, out num1)) return true;
            return false;
        }

        public static double SplitterFormul(string formul, string[] sd)
        {
            string CH_;
            string FormulGenerated = "";
            for (int i = 0; i < formul.Length; i++)
            {
                string S = formul[i].ToString();
                if (Is_NumericORTenths(S))
                {
                    FormulGenerated += S; i++;
                    for (int o = i; o < formul.Length; o++)
                    {
                        CH_ = formul[i].ToString();
                        if (Is_NumericORTenths(CH_)) { FormulGenerated += CH_; i++; }
                    }
                    i--;
                }
                else
                {
                    switch (S)
                    {
                        case "A":
                            FormulGenerated += sd[0];
                            break;
                        case "B":
                            FormulGenerated += sd[1];
                            break;
                        case "C":
                            FormulGenerated += sd[2];
                            break;
                        case "D":
                            FormulGenerated += sd[3];
                            break;
                        case "E":
                            FormulGenerated += sd[4];
                            break;
                        case "F":
                            FormulGenerated += sd[5];
                            break;
                        case "G":
                            FormulGenerated += sd[6];
                            break;
                        case "/":
                            FormulGenerated += "/";
                            break;
                        case "-":
                            FormulGenerated += "-";
                            break;
                        case "+":
                            FormulGenerated += "+";
                            break;
                        case "*":
                            FormulGenerated += "*";
                            break;
                    }
                }
            }

            return EvaluateExpression(FormulGenerated);
        }


        #region CompileScript C#
        public static double EvaluateExpression(string expression)
        {
            string code = string.Format  // Note: Use "{{" to denote a single "{"  
            (
                "public static class Func{{ public static double func(){{ return {0};}}}}",
                expression
            );

            CompilerResults compilerResults = CompileScript(code);

            if (compilerResults.Errors.HasErrors)
            {
                throw new InvalidOperationException("Expression has a syntax error.");
            }

            Assembly assembly = compilerResults.CompiledAssembly;
            MethodInfo method = assembly.GetType("Func").GetMethod("func");

            return (double)method.Invoke(null, null);
        }

        public static CompilerResults CompileScript(string source)
        {
            CompilerParameters parms = new CompilerParameters();

            parms.GenerateExecutable = false;
            parms.GenerateInMemory = true;
            parms.IncludeDebugInformation = false;

            CodeDomProvider compiler = CSharpCodeProvider.CreateProvider("CSharp");

            return compiler.CompileAssemblyFromSource(parms, source);
        }
        #endregion
    }
}

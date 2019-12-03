using System;

using Microsoft.Quantum.Simulation.Core;
using Microsoft.Quantum.Simulation.Simulators;
using Microsoft.Quantum.Intrinsic;

namespace qsharp_playground
{
    class Driver
    {
        static void Main(string[] args)
        {
            using (var qsim = new QuantumSimulator())
            {

                // 0 => Identity => constant function
                // 1 => CNOT => balanced
                var f = 0;
                if ( f == 0) {
                    System.Console.WriteLine("Sending Identity which is a constant function");
                } else {
                    System.Console.WriteLine("Sending cnot which is a balanced function");
                }
                var r3 = Deutch.Run(qsim, f).Result;
                System.Console.WriteLine(r3);
                if (r3 == Result.Zero) {
                    System.Console.WriteLine("Function is balanced");
                } else {
                    System.Console.WriteLine("Function is constant");
                }
            }
        }
    }
}
namespace qsharp_playground
{
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Arrays;
    open Microsoft.Quantum.Simulation;

    operation HelloQ () : Result {
        using(q = Qubit()) {
            H(q);
            let r = M(q);
            Reset(q);
            return r;
        }
    }

    operation RandomQ(): (Result, Result) {
        using((q1,q2) = (Qubit(), Qubit())) {
            H(q1);
            CNOT(q1, q2);

            X(q1);
            let r2 = M(q2);

            Reset(q2);
            Reset(q1);

            return (One, r2);
        }
    }


    operation Constant_Fn(x: Qubit, y: Qubit): Unit {
        I(y);
    }

    operation Balanced_Fn(x: Qubit, y: Qubit): Unit {
        CNOT(x, y);
    }

    operation Deutch(op: Int): Result {
        mutable uf = Constant_Fn;
        if (op == 1) {
            set uf = Balanced_Fn;
        }

        using((inq,outq) = (Qubit(), Qubit())) {
            //X(outq);

            ApplyToEach(X, [inq, outq]);
            ApplyToEach(H, [inq, outq]);

            //apply Func
            uf(inq,outq);

            H(inq);
            let res = M(inq);
            Reset(inq);
            Reset(outq);
            return res;
        }
    }
}

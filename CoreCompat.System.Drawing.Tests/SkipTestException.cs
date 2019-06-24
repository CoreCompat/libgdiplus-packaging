using System;
using System.Runtime.Serialization;

namespace Microsoft.DotNet.XUnitExtensions
{
    class SkipTestException : Exception
    {
        public SkipTestException()
        {
        }

        public SkipTestException(string message) : base(message)
        {
        }

        public SkipTestException(string message, Exception innerException) : base(message, innerException)
        {
        }

        protected SkipTestException(SerializationInfo info, StreamingContext context) : base(info, context)
        {
        }
    }
}

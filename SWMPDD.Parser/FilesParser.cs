using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SWMPDD.Parser
{
    class FilesParser
    {
        private FilesParser()
        {
        }
        private static FilesParser instance = new FilesParser();
        public FilesParser Instance
        {
            get { return instance; }
        }
    }
}

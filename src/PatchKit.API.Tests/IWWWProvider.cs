﻿using PatchKit.API.Web;

namespace PatchKit.API.Tests
{
    public interface IWWWProvider
    {
        IStringDownloader GetWWW();
    }
}

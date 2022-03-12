using System;
using System.Collections.Generic;
using System.Text;
using System.Collections;
using DCC.UMB.CDF.UIControls.Windows;

namespace DCC.UMB.CDF.MGMT.Modal
{
    /// <summary>
    /// Represents the calling chain links. The links are added on the top and are removed from 
    /// the top with the LIFO model (stack model)
    /// </summary>
    internal class Chain
    {
        Stack<Link> lstLinks = new Stack<Link>();

        /// <summary>
        /// Adds a link on the top of the chain
        /// </summary>
        /// <param name="link"></param>
        public void AddLink(Link link)
        {
            this.lstLinks.Push(link);
        }

        /// <summary>
        /// Removes the link from the top of the chain
        /// </summary>
        public Link RemoveLink()
        {
            this.lstLinks.Pop();
            if (this.lstLinks.Count > 0)
            {
                return this.lstLinks.Peek();
            }
            return null;
        }

        public AbstractScreen GetPreviousSibling(AbstractScreen aLinkScreen)
        {
            Link linkOfCurrentScreen = GetLinkOfType(aLinkScreen.GetType());
            bool foundCurrentLink = false;
            foreach (Link link in lstLinks)
            {
                if (foundCurrentLink)
                {
                    return link.CalledScreen;
                }
                if (link.CalledScreen == aLinkScreen)
                {
                    foundCurrentLink = true;
                }
            }
            return null;
        }


        /// <summary>
        /// Gets a Link in this chain which is of type parameter "type"
        /// </summary>
        /// <param name="type"></param>
        /// <returns></returns>
        internal Link GetLinkOfType(Type type)
        {
            foreach (Link link in lstLinks)
            {
                if (link.CalledScreen.GetType() == type)
                {
                    return link;
                }
            }
            return null;
        }
    }
}

using MailBee.ImapMail;
using QLD.Library;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using MailBee.Mime;

namespace QLD.Controllers.Test
{
    public class MailBoxController : Controller
    {
        public object FolderAccess { get; private set; }
        
        // GET: MailBox
        public ActionResult Index( )
            
        {
            List<Email> Email = new List<Email>();
            Imap imp = new Imap();
       //imp.DeleteMessages(, true);
            // Connect to the server, login and select inbox.
            imp.Connect("IMAP.gmail.com");
            imp.Login("tanhoang1193@gmail.com", "tantan1193");
            imp.SelectFolder("INBOX");
            string range;

            // Does the inbox contain at least 10 mails?
            if (imp.MessageCount >= 10)
            {
                // We'll get last 10 mails.
                range = (imp.MessageCount - 9).ToString() + ":" + "*";
            }
            else
            {
                // We'll get all mails.
                range = Imap.AllMessages;
            }

            // Get envelopes for the specified messages.
            EnvelopeCollection envelopes = imp.DownloadEnvelopes(range, false);

            // Make newer messages be displayed first.
            envelopes.Reverse();
            
            foreach (Envelope env in envelopes)
            {
                
            Email.Add(new Email()
            {
                Uid = env.Uid,
                subject = env.Subject,
                name = env.From,
                Date = env.Date
               
            });               
            }
            // Disconnect from the server.
            imp.Disconnect();
            return View(Email.ToList());
        }
        [HttpPost]
        public ActionResult Index(FormCollection form, string typeName)
        {
            var inputCheck = form.GetValues("inputCheck");
            ViewBag.Mess = EvenList(inputCheck, typeName);
            List<Email> Email = new List<Email>();
            Imap imp = new Imap();
      
            // Connect to the server, login and select inbox.
            imp.Connect("IMAP.gmail.com");
            imp.Login("tanhoang1193@gmail.com", "tantan1193");
            imp.SelectFolder("INBOX");
            // Get envelopes for the specified messages.
            EnvelopeCollection envelopes = imp.DownloadEnvelopes(Imap.AllMessages, false);
            // Make newer messages be displayed first.
            envelopes.Reverse();

            foreach (Envelope env in envelopes)
            {
                Email.Add(new Email()
                {
                    Uid = env.Uid,
                    subject = env.Subject,
                    name = env.From,
                    Date = env.Date
                });
            }
            // Disconnect from the server.
            imp.Disconnect();
            return View(Email.ToList());
       
        }

        public ActionResult DetailMail(long id)
        { 
            Email Email = new Email();
            Imap imp =new Imap();
       
            // Connect to the server, login and select inbox.
            imp.Connect("IMAP.gmail.com");
            imp.Login("tanhoang1193@gmail.com", "tantan1193");
            imp.SelectFolder("INBOX");
            EnvelopeCollection envelopes = imp.DownloadEnvelopes(Imap.AllMessages, false);
            envelopes.Reverse();
            foreach (Envelope env in envelopes)
            {
                if (id == env.Uid)
                {    
                    Email.subject = env.Subject;
                    Email.name = env.From;
                    Email.Date = env.Date;
                
                    break;
                }
            }
            // Disconnect from the server.
            imp.Disconnect();
            return View(Email);
        }
        private int EvenList(string[] inputCheck, string typeName)
        {
            int rowFinish = 0;
            int ms = 0;
            if (inputCheck != null)
            {
                int rowTotla = inputCheck.Count();
                switch (typeName)
                {
                    case "delete":
                        ms = 6; rowFinish = DeleteConfirmed(inputCheck);
                        break;
                }
                ViewBag.rowError = rowTotla - rowFinish;
            }
            ViewBag.rowFinish = rowFinish;
            return ms;
        }

        public int DeleteConfirmed(string[] inputCheck)
        {
            Email Email = new Email();
            Imap imp = new Imap();
          
            // Connect to the server, login and select inbox.
            imp.Connect("IMAP.gmail.com");
            imp.Login("tanhoang1193@gmail.com", "tantan1193");
            imp.SelectFolder("INBOX");
            EnvelopeCollection envelopes = imp.DownloadEnvelopes(Imap.AllMessages, false);
            envelopes.Reverse();
            int rowFinish = 0;
            if (inputCheck == null) return rowFinish;
            foreach (var s in inputCheck)
            {
                long idMenu = Convert.ToInt32(DefineFuntion.Decrypt(s));
                foreach (Envelope env in envelopes)
                {
                    
                    if (idMenu == env.Uid)
                    {
                        imp.DeleteMessages(env.Uid.ToString(), true);
                        break;
                    }
                }
            }
        
            // Disconnect from the server.
            imp.Disconnect();
            return rowFinish;
        }
        public class Email
        {
            public long Uid { get; set; }
            public string subject { get; set; }
            public string text { get; set; }
            public EmailAddress name { get; set; }
            public  DateTime Date { get; set; }
         
        }
    }
 
}
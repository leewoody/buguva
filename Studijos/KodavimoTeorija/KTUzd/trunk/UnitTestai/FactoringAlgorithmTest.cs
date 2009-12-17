﻿using KTUzd.Solution;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using KTUzd.Models;

namespace UnitTestai
{
    
    
    /// <summary>
    ///This is a test class for FactoringAlgorithmTest and is intended
    ///to contain all FactoringAlgorithmTest Unit Tests
    ///</summary>
    [TestClass()]
    public class FactoringAlgorithmTest
    {


        private TestContext testContextInstance;

        /// <summary>
        ///Gets or sets the test context which provides
        ///information about and functionality for the current test run.
        ///</summary>
        public TestContext TestContext
        {
            get
            {
                return testContextInstance;
            }
            set
            {
                testContextInstance = value;
            }
        }

        #region Additional test attributes
        // 
        //You can use the following additional attributes as you write your tests:
        //
        //Use ClassInitialize to run code before running the first test in the class
        //[ClassInitialize()]
        //public static void MyClassInitialize(TestContext testContext)
        //{
        //}
        //
        //Use ClassCleanup to run code after all tests in a class have run
        //[ClassCleanup()]
        //public static void MyClassCleanup()
        //{
        //}
        //
        //Use TestInitialize to run code before running each test
        //[TestInitialize()]
        //public void MyTestInitialize()
        //{
        //}
        //
        //Use TestCleanup to run code after each test has run
        //[TestCleanup()]
        //public void MyTestCleanup()
        //{
        //}
        //
        #endregion


        /// <summary>
        ///A test for FullFactorization
        ///</summary>
        [TestMethod()]
        public void FullFactorizationTest()
        {
            Polynomial poly = new Polynomial();
            poly.Q = 5;
            poly.P = 5;
            poly.M = 1;
            poly[8] = 1;
            poly[0] = -1;
            //Polynomial[] expected = null; // TODO: Initialize to an appropriate value
            Polynomial[] actual = FactoringAlgorithm.FullFactorization(poly);
            Assert.AreEqual(3, actual.Length);            
        }

        [TestMethod]
        public void XorTest()
        {
            byte exp = 0;
            byte actual = 3 ^ 3;
            Assert.AreEqual(exp, actual);
        }
    }
}
//
// BaseMethodParameterNameMismatchIssueTests.cs
//
// Author:
//       Mike Krüger <mkrueger@xamarin.com>
//
// Copyright (c) 2013 Xamarin Inc. (http://xamarin.com)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
using NUnit.Framework;
using ICSharpCode.NRefactory.CSharp.Refactoring;

namespace ICSharpCode.NRefactory.CSharp.CodeIssues
{
	[TestFixture]
	public class BaseMethodParameterNameMismatchIssueTests : InspectionActionTestBase
	{
		[Test]
		public void TestMethod ()
		{
			Test<BaseMethodParameterNameMismatchIssue>(@"
class Foo
{
	public virtual void FooBar (int bar) {}
}

class Bar : Foo
{
	public override void FooBar (int foo)
	{
	}
}
", @"
class Foo
{
	public virtual void FooBar (int bar) {}
}

class Bar : Foo
{
	public override void FooBar (int bar)
	{
	}
}
");
		}
	
		[Test]
		public void TestIndexer ()
		{
			Test<BaseMethodParameterNameMismatchIssue>(@"
class Foo
{
	protected virtual int this[int i, int j] { get { return 1; } }
}

class Bar : Foo
{
	protected override int this[int i, int x] { get { return 1; } }
}
", @"
class Foo
{
	protected virtual int this[int i, int j] { get { return 1; } }
}

class Bar : Foo
{
	protected override int this[int i, int j] { get { return 1; } }
}
");
		}
	}
}

